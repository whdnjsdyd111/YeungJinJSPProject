package main.command.member.index;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.FeedbackDBBean;
import main.command.CommandAction;

public class FeedbackInsertProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		
		
		request.setAttribute("check", new Integer(FeedbackDBBean.getInstance().insertFeedback(email, content)));
		return "/member/index/feedbackInsertPro.jsp";
	}
}
