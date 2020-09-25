package main.command.member.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.BookmarkDBBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class BookmarkInsertDeleteAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		
		BookmarkDBBean bookmarkProcess = BookmarkDBBean.getInstance();
		
		int board_id = Integer.valueOf(request.getParameter("board_id"));
		int mem_id = (Integer) request.getSession().getAttribute("YJFBID_SES");
		String way = request.getParameter("way");
		int check = 1;
		
		if(way.equals("insert")) {
			check = bookmarkProcess.insertBookmark(mem_id, board_id);
		} else if(way.equals("delete")) {
			check = bookmarkProcess.deleteBookmark(mem_id, board_id);
		}
		
		request.setAttribute("check", new Integer(check));
		return "/member/board/bookmarkInsertDelete.jsp";
	}
}
