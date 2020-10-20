package main.command.admin.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.FeedbackDBBean;
import main.command.CommandAction;

public class FeedbackAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String sort = request.getParameter("sort");
		
		if(sort == null) {
			request.setAttribute("feedbacks", new Integer(0));
			return "/admin/dashboard/feedback.jsp";
		} else {
			if(sort.equals("processed")) {
				request.setAttribute("processedFeedbacks", FeedbackDBBean.getInstance().getProcessedFeedbacks());
			} else if(sort.equals("nonProcessed")) {
				request.setAttribute("nonProcessedFeedbacks", FeedbackDBBean.getInstance().getNonProcessedFeedbacks());
			} else {
				request.setAttribute("feedbacks", new Integer(0));
				return "/admin/dashboard/feedback.jsp";
			}
		}
		
		return "/admin/dashboard/feedback.jsp";
	}
}
