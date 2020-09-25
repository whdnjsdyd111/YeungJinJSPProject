package main.command.member.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.MemberDBBean;
import main.command.CommandAction;

public class UpdatePasswordAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		String password = request.getParameter("password");
		String new_password = request.getParameter("new_password");
		int mem_id = (Integer) request.getSession().getAttribute("YJFBID_SES");
		
		MemberDBBean memberProcess = MemberDBBean.getInstance();
		
		int check = memberProcess.userCheck(mem_id, password);
		
		if(check == 2) {
			int check2 = memberProcess.updatePassword(mem_id, new_password);
			
			if(check2 != 1)
				check = 0;
		}
		
		request.setAttribute("check", new Integer(check));
		return "/member/login/updatePassword.jsp";
	}
}
