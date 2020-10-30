package main.command.member.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.MemberDBBean;
import main.command.CommandAction;

public class CheckPasswordProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		String pw = request.getParameter("pw");
		int mem_id = (Integer) request.getSession().getAttribute("YJFBID_SES");
		
		MemberDBBean memberProcess = MemberDBBean.getInstance();
		
		int check = memberProcess.userCheck(mem_id, pw);
		
		if(check == 1) {
			request.getSession().setAttribute("check_password", check);
		}
		
		request.setAttribute("check", new Integer(check));
		return "/member/login/checkPasswordPro.jsp";
	}
}
