package main.bean;

import java.sql.Timestamp;

public class ChatLogDataBean {
	private int chat_id;
	private int admin_id;
	private String chat_content;
	private Timestamp chat_time;
	private String admin_name;
	
	
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public int getChat_id() {
		return chat_id;
	}
	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public Timestamp getChat_time() {
		return chat_time;
	}
	public void setChat_time(Timestamp chat_time) {
		this.chat_time = chat_time;
	}
	
	
}
