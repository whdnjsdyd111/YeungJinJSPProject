package main.command.admin.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.FeedbackDBBean;
import main.command.CommandAction;

public class FeedbackProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		
		request.setAttribute("check", new Integer(FeedbackDBBean.getInstance().changePro(Integer.parseInt(request.getParameter("feed_id")))));
		return "/admin/dashboard/feedbackPro.jsp";
	}
}
