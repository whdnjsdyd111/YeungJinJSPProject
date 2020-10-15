package main.command.admin.dashboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.command.CommandAction;

public class ChattingRoomAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/admin/dashboard/chattingRoom.jsp";
	}
}
