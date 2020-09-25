package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.NestCommentDBBean;
import main.command.CommandAction;

public class NestCommentDeleteAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		int nest_com_id = Integer.valueOf(request.getParameter("nest_com_id"));
		
		int check = NestCommentDBBean.getInstance().deleteNestComment(nest_com_id);
		
		request.setAttribute("check", new Integer(check));
		return "/member/board/nestCommentDelete.jsp";
	}
}
