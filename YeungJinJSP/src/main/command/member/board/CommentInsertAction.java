package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.CommentDBBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class CommentInsertAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		SHA256 sha = SHA256.getInstance();
		AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_key"));
		CommentDBBean commentProcess = CommentDBBean.getInstance();
		
		request.setCharacterEncoding("utf-8");
		int board_id = Integer.valueOf(request.getParameter("board_id"));
		int mem_id = Integer.valueOf(aes.aesDecode((String) request.getSession().getAttribute("YJFBID_SES")));
		String content = request.getParameter("content");
	
		int check = commentProcess.commentInsert(mem_id, board_id, content);
		
		request.setAttribute("check", new Integer(check));
		return "/member/board/commentInsert.jsp";
	}
}
