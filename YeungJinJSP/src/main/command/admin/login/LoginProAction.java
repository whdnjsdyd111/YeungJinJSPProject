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
		String admin_email = request.getParameter("email");
		String admin_passwd = request.getParameter("pw");
		
		int admin_id = AdminDBBean.getInstance().getAdminId(admin_email, admin_passwd);

		request.setAttribute("admin_id", new Integer(admin_id));
		return "/admin/login/loginPro.jsp";
	}
}
