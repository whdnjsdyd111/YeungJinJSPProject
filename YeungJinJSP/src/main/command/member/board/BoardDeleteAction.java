package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.BoardDBBean;
import main.command.CommandAction;

public class BoardDeleteAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		int board_id = Integer.valueOf(request.getParameter("board_id"));
		BoardDBBean boardProcess = BoardDBBean.getInstance();
		
		int check = boardProcess.deleteBoard(board_id);
		
		request.setAttribute("check", new Integer(check));
		return "/member/board/boardDelete.jsp";
	}
}
