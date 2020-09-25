package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.CommentDBBean;
import main.command.CommandAction;

public class CommentDeleteAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		int com_id = Integer.valueOf(request.getParameter("com_id"));
		
		int check = CommentDBBean.getInstance().commentDelete(com_id);
		
		request.setAttribute("check", new Integer(check));
		return "/member/board/commentDelete.jsp";
	}
}
