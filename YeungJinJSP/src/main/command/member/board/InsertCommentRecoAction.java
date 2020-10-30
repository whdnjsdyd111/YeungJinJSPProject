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
					// 누른 버튼이 추천인데 이미 추천되있을 경우
					// comment_recommend 에서 지우기
					check1 = comRecoProcess.deleteComReco(com_id, mem_id);
					// comment의 추천 수 -1 바꾸기
					check2 = comProcess.updateComReco(com_id, -1);
				} else if(!check_reco && check_nonReco) {
					// 누른 버튼이 추천인데 비추가 되어있을 경우
					// comment_recommend에 nonReco N로 바꾸기
					check1 = comRecoProcess.updateNonReco(com_id, mem_id, "N");
					// comment의 추천 수 +2 바꾸기
					check2 = comProcess.updateComReco(com_id, +2);
				}
			} else {
				if(check_nonReco) {
					// 누른 버튼이 비추인데 이미 비추일 경우
					// comment_recommand에서 지우기
					check1 = comRecoProcess.deleteComReco(com_id, mem_id);
					// comment의 추천 수 +1 바꾸기
					check2 = comProcess.updateComReco(com_id, +1);
				} else if(check_reco && !check_nonReco) {
					// 누른건 비추인데 추천이 되어있을 경우
					// comment_recommand에 nonReco Y로 바꾸기
					check1 = comRecoProcess.updateNonReco(com_id, mem_id, "Y");
					// comment의 추천수 -2 바꾸기
					check2 = comProcess.updateComReco(com_id, -2);
				}
			}
		} else {
			if(btn.equals("reco")) {
				// 디비에 없는 상태에서 누른 버튼이 reco일 경우
				check1 = comRecoProcess.insertComReco(com_id, mem_id);
				// comment의 추천수 +1 바꾸기
				check2 = comProcess.updateComReco(com_id, +1);
			} else {
				// 디비에 없는 상태에서 누른 버튼이 nonReco일 경우
				check1 = comRecoProcess.insertComNonReco(com_id, mem_id);
				// comment의 추천수 -1 바꾸기
				check2 = comProcess.updateComReco(com_id, -1);
			}
		}
		
		request.setAttribute("reco_count", new Integer(comProcess.getComReco(com_id)));
		request.setAttribute("check1", new Integer(check1));
		request.setAttribute("check2", new Integer(check2));
		return "/member/board/insertCommentReco.jsp";
	}
}
