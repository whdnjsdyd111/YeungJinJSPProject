package main.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import main.bean.VisitDBBean;

public class LoginCounter implements HttpSessionListener {
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		VisitDBBean.getInstance().insertUpdateCount();
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}
}
