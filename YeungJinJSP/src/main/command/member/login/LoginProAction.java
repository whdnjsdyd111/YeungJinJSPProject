package main.command.member.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.MemberDBBean;
import main.command.CommandAction;

public class LoginProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");

		MemberDBBean memProcess = MemberDBBean.getInstance();
		int check = memProcess.userCheck(email, pw);
		int mem_id = memProcess.getMem_id(email);

		request.setAttribute("mem_id", new Integer(mem_id));
		request.setAttribute("check", new Integer(check));
		return "/member/login/loginPro.jsp";
	}
}
