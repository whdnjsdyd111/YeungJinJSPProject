package main.command.admin.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.MemoDBBean;
import main.command.CommandAction;

public class MemoInsertProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");
		int admin_id = (Integer) request.getSession().getAttribute("YJFBID_ADMIN_SES");

		int check = MemoDBBean.getInstance().memoInsert(admin_id, content);
		
		request.setAttribute("check", new Integer(check));
		return "/admin/dashboard/memoInsertPro.jsp";
	}
}
