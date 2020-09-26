package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.BoardDBBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class UpdateBoardProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int kind = Integer.valueOf(request.getParameter("kind"));
		int board_id = Integer.valueOf(request.getParameter("board_id"));
		int id = (Integer) request.getSession().getAttribute("YJFBID_SES");
		
		if(kind == 600 || kind == 700) {
			request.setAttribute("check", new Integer(0));
			return "/member/board/updateBoardPro.jsp";
		}
		
		BoardDBBean boardProcess = BoardDBBean.getInstance();
		int check = boardProcess.updateBoard(id, board_id, kind, title, content);
		
		request.setAttribute("check", new Integer(check));
		return "/member/board/updateBoardPro.jsp";
	}
}