package main.command.member.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.MemberDBBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class RegisterCompleteAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String enc = request.getParameter("token");
		
		MemberDBBean mem = MemberDBBean.getInstance();
		SHA256 sha = SHA256.getInstance();
		AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_key"));
		
		int mem_id = Integer.valueOf(aes.aesDecode(enc));
		
		int check = mem.updateAuth(mem_id);
		
		request.setAttribute("check", new Integer(check));
		return "/member/login/registerComplete.jsp";
	}
}
