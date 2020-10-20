package main.command.admin.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AdminDBBean;
import main.bean.MemberDBBean;
import main.command.CommandAction;

public class LoginProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		request.setAttribute("admin_id", new Integer(AdminDBBean.getInstance().getAdminId(request.getParameter("email"), 
				request.getParameter("pw"))));
		return "/admin/login/loginPro.jsp";
	}
}
