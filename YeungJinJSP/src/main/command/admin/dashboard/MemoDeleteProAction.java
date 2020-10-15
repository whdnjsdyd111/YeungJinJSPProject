package main.command.admin.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.MemoDBBean;
import main.command.CommandAction;

public class MemoDeleteProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		int memo_id = Integer.parseInt(request.getParameter("memo_id"));
		
		int check = MemoDBBean.getInstance().memoDelete(memo_id);
		
		request.setAttribute("check", new Integer(check));
		return "/admin/dashboard/memoDeletePro.jsp";
	}
}
