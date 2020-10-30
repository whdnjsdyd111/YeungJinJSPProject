package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.CommentDBBean;
import main.bean.CommentRecommandDBBean;
import main.bean.MemberDBBean;
import main.command.CommandAction;

public class InsertCommentRecoAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		int com_id = Integer.valueOf(request.getParameter("com_id"));
		
		CommentRecommandDBBean comRecoProcess = CommentRecommandDBBean.getInstance();
		CommentDBBean comProcess = CommentDBBean.getInstance();
		
		int mem_id = (Integer) request.getSession().getAttribute("YJFBID_SES");
		boolean check_reco = Boolean.valueOf(request.getParameter("check_reco"));
		boolean check_nonReco = Boolean.valueOf(request.getParameter("check_nonReco"));
		boolean check_db = Boolean.valueOf(request.getParameter("check_db"));
		String btn = request.getParameter("btn");
		
		if(MemberDBBean.getInstance().addComRecoEx(mem_id, com_id) == 0)
			return "/error/DBFail.jsp";
		
		int check1 = 0;
		int check2 = 0;
		
		if(check_db) {
			if(btn.equals("reco")) {
				if(check_reco) {
					// ���� ��ư�� ��õ�ε� �̹� ��õ������ ���
					// comment_recommend ���� �����
					check1 = comRecoProcess.deleteComReco(com_id, mem_id);
					// comment�� ��õ �� -1 �ٲٱ�
					check2 = comProcess.updateComReco(com_id, -1);
				} else if(!check_reco && check_nonReco) {
					// ���� ��ư�� ��õ�ε� ���߰� �Ǿ����� ���
					// comment_recommend�� nonReco N�� �ٲٱ�
					check1 = comRecoProcess.updateNonReco(com_id, mem_id, "N");
					// comment�� ��õ �� +2 �ٲٱ�
					check2 = comProcess.updateComReco(com_id, +2);
				}
			} else {
				if(check_nonReco) {
					// ���� ��ư�� �����ε� �̹� ������ ���
					// comment_recommand���� �����
					check1 = comRecoProcess.deleteComReco(com_id, mem_id);
					// comment�� ��õ �� +1 �ٲٱ�
					check2 = comProcess.updateComReco(com_id, +1);
				} else if(check_reco && !check_nonReco) {
					// ������ �����ε� ��õ�� �Ǿ����� ���
					// comment_recommand�� nonReco Y�� �ٲٱ�
					check1 = comRecoProcess.updateNonReco(com_id, mem_id, "Y");
					// comment�� ��õ�� -2 �ٲٱ�
					check2 = comProcess.updateComReco(com_id, -2);
				}
			}
		} else {
			if(btn.equals("reco")) {
				// ��� ���� ���¿��� ���� ��ư�� reco�� ���
				check1 = comRecoProcess.insertComReco(com_id, mem_id);
				// comment�� ��õ�� +1 �ٲٱ�
				check2 = comProcess.updateComReco(com_id, +1);
			} else {
				// ��� ���� ���¿��� ���� ��ư�� nonReco�� ���
				check1 = comRecoProcess.insertComNonReco(com_id, mem_id);
				// comment�� ��õ�� -1 �ٲٱ�
				check2 = comProcess.updateComReco(com_id, -1);
			}
		}
		
		request.setAttribute("reco_count", new Integer(comProcess.getComReco(com_id)));
		request.setAttribute("check1", new Integer(check1));
		request.setAttribute("check2", new Integer(check2));
		return "/member/board/insertCommentReco.jsp";
	}
}
