package main.command.member.login;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.bean.AES256Util;
import main.bean.MemberDBBean;
import main.bean.MemberDataBean;
import main.bean.SHA256;
import main.command.CommandAction;

public class LoginResendEmailAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		SHA256 sha = SHA256.getInstance();
		AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_register_key"));
		MemberDBBean memProcess = MemberDBBean.getInstance();
		
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		MemberDataBean mem = memProcess.getMember(email);
		
		String nick = mem.getMem_nickname();
		String enc = aes.aesEncode(String.valueOf(mem.getMem_id()));
		int checkMail = 0;
		
		Properties p = new Properties();
		
		p.put("mail.smtp.host","smtp.naver.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		p.put("mail.transport.protocol", "smtp");

		try {
			Authenticator auth = new SMTPAuthenticator();
			Session ses = Session.getInstance(p, auth);
			
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			
			msg.setSubject("YJFB�� ȸ�������� �Ϸ��ϼ���!");
			
			StringBuffer buffer = new StringBuffer();
			buffer.append("<h1>�̸��� ����</h1><br>");
			buffer.append("<p>" + nick +"���� �̸��� �ּҰ� " + email +"��(��) �´ٸ� �����Ͽ� ȸ�������� �Ϸ��Ͽ� �ֽʽÿ�.<br>");
			buffer.append("<p>1�ð� �̳��� �Ϸ��Ͻʽÿ�.</p><br>");
			buffer.append("<a href='http://localhost:8001/YeungJinFunnyBone/registerComplete.do?token=" + 
					enc + "'>ȸ������ �Ϸ�</a>");
			msg.setFrom(SMTPAuthenticator.from);
			
			Address toAddr = new InternetAddress(email);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			msg.setContent(buffer.toString(), "text/html;charset=UTF-8");
			Transport.send(msg);
			checkMail = 1;
		} catch (Exception e) {
			e.printStackTrace();
			
			request.setAttribute("checkMail", new Integer(checkMail));
			
			return "/member/login/loginResendEmail.jsp";
		}
		
		request.setAttribute("checkMail", new Integer(checkMail));
		
		return "/member/login/loginResendEmail.jsp";
		
		
		
	}
}
