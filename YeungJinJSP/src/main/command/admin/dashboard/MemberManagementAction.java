package main.command.admin.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.MemberDBBean;
import main.command.CommandAction;

public class MemberManagementAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String sort = request.getParameter("sort");
		
		if(sort == null) {
			request.setAttribute("none_param", new Integer(1));
		} else {
			if(sort.equals("new"))
				request.setAttribute("member", MemberDBBean.getInstance().getMemberOrderByTimeDesc());
			else if(sort.equals("old"))
				request.setAttribute("member", MemberDBBean.getInstance().getMemberOrderByTimeAsc());
			else if(sort.equals("level"))
				request.setAttribute("member", MemberDBBean.getInstance().getMemberOrderByLevel());
			else
				request.setAttribute("none_param", new Integer(1));
		}
		
		return "/admin/dashboard/memberManagement.jsp";
	}
}
