package main.command.member.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.MemberDBBean;
import main.command.CommandAction;

public class ConfirmNickAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String nickname = request.getParameter("nickname");
		
		MemberDBBean mem = MemberDBBean.getInstance();
		int check = mem.checkNick(nickname);
		
		request.setAttribute("check", new Integer(check));
		return "/member/login/confirmNick.jsp";
	}
}
