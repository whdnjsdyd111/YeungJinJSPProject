package main.command.admin.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.MemoDBBean;
import main.command.CommandAction;

public class MemoDeleteProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		request.setAttribute("check", new Integer(MemoDBBean.getInstance().memoDelete(
				Integer.parseInt(request.getParameter("memo_id")))));
		return "/admin/dashboard/memoDeletePro.jsp";
	}
}
