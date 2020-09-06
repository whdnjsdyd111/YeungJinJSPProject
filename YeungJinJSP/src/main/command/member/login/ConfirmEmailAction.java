package main.command.member.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.MemberDBBean;
import main.command.CommandAction;

public class ConfirmEmailAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		
		MemberDBBean mem = MemberDBBean.getInstance();
		int check = mem.checkEmail(email);
		
		request.setAttribute("check", new Integer(check));
		return "/member/login/confirmEmail.jsp";
	}
}
