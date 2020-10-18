package main.command.admin.dashboard;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.ChatLogDBBean;
import main.bean.JoinMemberAdminDataBean;
import main.command.CommandAction;

public class ChattingRoomAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		ServletContext application = request.getServletContext();
		
		JoinMemberAdminDataBean admin_member = (JoinMemberAdminDataBean) 
				application.getAttribute(String.valueOf(request.getSession().getAttribute("YJFBID_ADMIN_SES")));
		
		request.setAttribute("admin_member", admin_member);
		request.setAttribute("chattings", ChatLogDBBean.getInstance().getChats());
		return "/admin/dashboard/chattingRoom.jsp";
	}
}
