package main.command.member.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.MemberDBBean;
import main.command.CommandAction;

public class UpdateNicknameAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		String nickname = request.getParameter("nickname");
		int mem_id = (Integer) request.getSession().getAttribute("YJFBID_SES");
		
		int check = MemberDBBean.getInstance().updateNickname(mem_id, nickname);
		
		request.setAttribute("check", new Integer(check));
		return "/member/login/updateNickname.jsp";
	}
}
