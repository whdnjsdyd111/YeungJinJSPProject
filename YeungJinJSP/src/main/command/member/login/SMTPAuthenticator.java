package main.command.member.login;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
	final static String from = "whdnjsdyd111@naver.com";
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(from, "dyd6881478");
	}
}
