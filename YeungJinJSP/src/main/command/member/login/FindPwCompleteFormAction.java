package main.command.member.login;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.SHA256;
import main.command.CommandAction;

public class FindPwCompleteFormAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		String enc = request.getParameter("token");
		String timeEnc = request.getParameter("timeToken");
		int checkMail = 0;

		SHA256 sha = SHA256.getInstance();
		AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_findPassword_key"));
		
		Timestamp mailTime = Timestamp.valueOf(aes.aesDecode(timeEnc));
		Timestamp current = new Timestamp(System.currentTimeMillis());
		
		int time = (int) ((current.getTime() - mailTime.getTime()) / 1000 / 60);

		System.out.println(time);

		if(time < 5) {
			checkMail = 1;
		} else {
			checkMail = 0;
		}
		
		request.setAttribute("checkMail", new Integer(checkMail));
		request.setAttribute("enc", enc);
		return "/member/login/findPasswdCompleteForm.jsp";
	}
}
