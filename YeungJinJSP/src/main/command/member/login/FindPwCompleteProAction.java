package main.command.member.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.MemberDBBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class FindPwCompleteProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");
		String passwd = request.getParameter("password");
		String enc = request.getParameter("enc");
		
		System.out.println(enc);
		
		MemberDBBean mem = MemberDBBean.getInstance();
		SHA256 sha = SHA256.getInstance();
		AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_findPassword_key"));

		int checkDB = mem.updatePassword(Integer.valueOf(aes.aesDecode(enc)), passwd);
		
		request.setAttribute("checkDB", new Integer(checkDB));
		return "/member/login/findPasswdCompletePro.jsp";
	}
}
