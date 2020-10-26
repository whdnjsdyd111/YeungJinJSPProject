package main.command.admin.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.DeletedContentsDBBean;
import main.command.CommandAction;

public class RestoreContentsAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		String board_id = request.getParameter("board_id");
		String com_id = request.getParameter("com_id");
		String neCom_id = request.getParameter("neCom_id");
		
		if(board_id != null)
			request.setAttribute("check", DeletedContentsDBBean.getInstance().restoreBoard(Integer.parseInt(board_id)));
		else if(com_id != null)
			request.setAttribute("check", DeletedContentsDBBean.getInstance().restoreComment(Integer.parseInt(com_id)));
		else if(neCom_id != null)
			request.setAttribute("check", DeletedContentsDBBean.getInstance().restoreNestComment(Integer.parseInt(neCom_id)));
		
		return "/admin/dashboard/restoreContents.jsp";
	}
}
