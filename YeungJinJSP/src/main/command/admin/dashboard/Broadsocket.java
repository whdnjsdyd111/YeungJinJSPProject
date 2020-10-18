package main.command.admin.dashboard;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import main.bean.AdminDBBean;
import main.bean.ChatLogDBBean;


@ServerEndpoint("/chatting")
public class Broadsocket {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private static Map<Integer, String> admin_map = new HashMap<>();
	
	public Broadsocket() {
		admin_map.putAll(AdminDBBean.getInstance().getAdminMap());
	}
	
	@OnMessage
	public void onMessage(String datas, Session session) throws IOException {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		
		int id;
		String message = null;
		try {
			obj = (JSONObject) parser.parse(datas);
		} catch (ParseException e) {
			notice(datas);
			return;
		}
		
		LocalDate curDate = LocalDate.now();
		LocalTime curTime = LocalTime.now();
		String date = "" + curDate.getMonthValue() + "." + curDate.getDayOfMonth() + " " + curTime.getHour() + ":" + curTime.getMinute();

		id = Integer.parseInt((String) obj.get("id").toString());
		message = (String) obj.get("message");
		
		String json = "{\"name\":\"" + admin_map.get(id) + "\",\"time\":\"" + date + "\",\"message\":\"" + message + "\"}";
		
		synchronized (clients) {
			for(Session client : clients) {
				if(!client.equals(session))
					client.getBasicRemote().sendText(json);
			}
		}
		
		ChatLogDBBean.getInstance().insertChatLog(id, message);
	}
	
	private void notice(String message) throws IOException {
		synchronized (clients) {
			for(Session client : clients) {
				client.getBasicRemote().sendText(message);
			}
		}
	}
	
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
	}
	
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
}
