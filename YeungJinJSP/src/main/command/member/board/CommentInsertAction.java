package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.CommentDBBean;
import main.bean.NoticeDBBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class CommentInsertAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		CommentDBBean commentProcess = CommentDBBean.getInstance();
		
		request.setCharacterEncoding("utf-8");
		int board_id = Integer.valueOf(request.getParameter("board_id"));	// �Խ��� ��ȣ
		int mem_id = (Integer) request.getSession().getAttribute("YJFBID_SES");	// �ۼ���
		String content = request.getParameter("content");	// ����
	
		
		
		int check = commentProcess.commentInsert(mem_id, board_id, content);
		
		
		
		if(check == 1) {
			int check2 = NoticeDBBean.getInstance().insertCommentNotice(board_id, mem_id);
			
			if(check2 != 1)
				return "/error/DBFail.jsp";
		}
		
		request.setAttribute("check", new Integer(check));
		return "/member/board/commentInsert.jsp";
	}
}
