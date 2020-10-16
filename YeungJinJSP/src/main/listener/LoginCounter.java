package main.listener;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.catalina.core.ApplicationContext;

import main.bean.VisitDBBean;

public class LoginCounter implements HttpSessionListener {
	private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>();
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		VisitDBBean.getInstance().insertUpdateCount();
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		System.out.println(se.getSession().getAttribute("YJFBID_ADMIN_SES"));
		
		ServletContext servlet = se.getSession().getServletContext();
		
		servlet.removeAttribute(String.valueOf(se.getSession().getAttribute("YJFBID_ADMIN_SES")));
		
	}
	
}
