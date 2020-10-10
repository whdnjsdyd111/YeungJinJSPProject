package main.listener;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import main.bean.VisitDBBean;

public class LoginCounter implements HttpSessionListener {
	private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>();
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		VisitDBBean.getInstance().insertUpdateCount();
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println("¼¼¼Ç ÆÄ±«µÊ");
		System.out.println(se.getSession().getAttribute("YJFBID_ADMIN_SES"));
	}
}
