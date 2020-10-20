package main.bean;

import java.sql.Timestamp;

public class FeedbackDataBean {
	private int feed_id;
	private String feed_email;
	private String feed_content;
	private Timestamp feed_date;
	private byte feed_pro;
	public int getFeed_id() {
		return feed_id;
	}
	public void setFeed_id(int feed_id) {
		this.feed_id = feed_id;
	}
	public String getFeed_email() {
		return feed_email;
	}
	public void setFeed_email(String feed_email) {
		this.feed_email = feed_email;
	}
	public String getFeed_content() {
		return feed_content;
	}
	public void setFeed_content(String feed_content) {
		this.feed_content = feed_content;
	}
	public Timestamp getFeed_date() {
		return feed_date;
	}
	public void setFeed_date(Timestamp feed_date) {
		this.feed_date = feed_date;
	}
	public byte getFeed_pro() {
		return feed_pro;
	}
	public void setFeed_pro(byte feed_pro) {
		this.feed_pro = feed_pro;
	}
	
	
}
