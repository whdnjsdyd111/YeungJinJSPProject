package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.NestCommentDBBean;
import main.bean.NoticeDBBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class NestCommentInsertAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		int board_id = Integer.valueOf(request.getParameter("board_id"));
		String target_mem_id = request.getParameter("target_mem_id");
		int com_id = Integer.valueOf(request.getParameter("com_id"));
		String content = request.getParameter("content");
		String notice_content = request.getParameter("notice_content");
		
		NestCommentDBBean nestProcess = NestCommentDBBean.getInstance();
		
		int mem_id = (Integer) request.getSession().getAttribute("YJFBID_SES");
		
		int check = nestProcess.insertNestComment(com_id, mem_id, content);
		
		if(check == 1) {
			try {
				int check2 = NoticeDBBean.getInstance().insertNestCommentNotice(Integer.valueOf(target_mem_id), board_id, mem_id, notice_content);
				
				if(check2 != 1)
					return "/error/DBFail.jsp";
			} catch (NumberFormatException e) {
				
			}
		}
		
		request.setAttribute("check", new Integer(check));
		return "/member/board/nestCommentInsert.jsp";
	}
}
