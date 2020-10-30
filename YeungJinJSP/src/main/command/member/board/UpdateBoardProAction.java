package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.BoardDBBean;
import main.command.CommandAction;

public class UpdateBoardProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		int kind = Integer.valueOf(request.getParameter("kind"));
		
		if(kind == 600 || kind == 700) {
			request.setAttribute("check", new Integer(0));
			return "/member/board/updateBoardPro.jsp";
		}
		
		
		request.setAttribute("check", new Integer(BoardDBBean.getInstance().updateBoard(
				(Integer) request.getSession().getAttribute("YJFBID_SES"), 
				Integer.valueOf(request.getParameter("board_id")), kind, 
				request.getParameter("title"), 
				request.getParameter("content"))));
		return "/member/board/updateBoardPro.jsp";
	}
}
