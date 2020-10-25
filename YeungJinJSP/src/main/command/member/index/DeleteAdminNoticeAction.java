package main.command.member.index;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AdminNoticeDBBean;
import main.command.CommandAction;

public class DeleteAdminNoticeAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		request.setAttribute("check", AdminNoticeDBBean.getInstance().deleteNotice(Integer.parseInt(request.getParameter("notice_id"))));
		return "/member/index/deleteAdminNotice.jsp";
	}
}
