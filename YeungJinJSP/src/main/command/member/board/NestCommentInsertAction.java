package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.NestCommentDBBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class NestCommentInsertAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		int com_id = Integer.valueOf(request.getParameter("com_id"));
		String content = request.getParameter("content");
		
		SHA256 sha = SHA256.getInstance();
		AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_key"));
		NestCommentDBBean nestProcess = NestCommentDBBean.getInstance();
		
		int mem_id = Integer.valueOf(aes.aesDecode((String) request.getSession().getAttribute("YJFBID_SES")));
		
		int check = nestProcess.insertNestComment(com_id, mem_id, content);
		
		request.setAttribute("check", new Integer(check));
		return "member/board/nestCommentInsert.jsp";
	}
}
