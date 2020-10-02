package main.command.member.login;

import java.sql.Timestamp;
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

public class FindPwProAction implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		MemberDBBean memProcess = MemberDBBean.getInstance();
		SHA256 sha = SHA256.getInstance();
		AES256Util aes = new AES256Util(sha.getSha256("random_mem_id_findPassword_key"));
		MemberDataBean member = new MemberDataBean();
		
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		
		member = memProcess.getMember(email);
		
		int checkMail = 0;
		
		String enc = aes.aesEncode(String.valueOf(member.getMem_id()));
		String timeEnc = aes.aesEncode(String.valueOf(new Timestamp(System.currentTimeMillis())));
		
		enc = enc.replace("+", "%2B");
		enc = enc.replace("&", "%26");
		
		timeEnc = timeEnc.replace("+", "%2B");
		timeEnc = timeEnc.replace("&", "%26");
		
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
			
			msg.setSubject("YJFB�� ��й�ȣ�� �缳���ϼ���!");
			
			StringBuffer buffer = new StringBuffer();
			buffer.append("<h1>��й�ȣ �缳��</h1><br>");
			buffer.append("<p>" + member.getMem_nickname() +"���� �̸��� �ּҰ� " + email +"��(��) �´ٸ� �����Ͽ� ��й�ȣ�� �缳���ϱ� ���� �Ʒ� ��ũ�� �̵����ּ���.<br>");
			buffer.append("<p>10�� �̳��� �Ϸ��Ͻʽÿ�.</p><br>");
			buffer.append("<a href='http://14.45.5.70:8000/YeungJinFunnyBone/findPasswdCompleteForm.do?token=" + 
					enc + "&timeToken=" + timeEnc + "'>��й�ȣ �缳��</a>");
			msg.setFrom(SMTPAuthenticator.from);
			
			Address toAddr = new InternetAddress(email);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			
			msg.setContent(buffer.toString(), "text/html;charset=UTF-8");
			Transport.send(msg);
			checkMail = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.setAttribute("checkMail", new Integer(checkMail));
		return "/member/login/findPasswdPro.jsp";
	}
}
