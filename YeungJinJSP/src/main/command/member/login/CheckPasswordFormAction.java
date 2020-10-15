package main.command.member.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.MemberDBBean;
import main.bean.MemberDataBean;
import main.command.CommandAction;

public class CheckPasswordFormAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		if(request.getSession().getAttribute("YJFBID_SES") == null)
			return "/member/login/checkPasswordForm.jsp";
		
		int mem_id = (Integer) request.getSession().getAttribute("YJFBID_SES");
		
		MemberDataBean member = MemberDBBean.getInstance().getMember(mem_id);
		
		request.setAttribute("email", member.getMem_email());
		return "/member/login/checkPasswordForm.jsp";
	}
}
