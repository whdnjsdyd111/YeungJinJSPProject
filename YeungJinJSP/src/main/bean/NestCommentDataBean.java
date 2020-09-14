package main.bean;

import java.sql.Timestamp;

public class NestCommentDataBean {
	private int neCom_id; 
	private int com_id;
	private int mem_id;
	private String mem_nickname;
	private int mem_level;
	private String reCom_content;
	private Timestamp reCom_date;
	
	public int getNeCom_id() {
		return neCom_id;
	}
	public void setNeCom_id(int neCom_id) {
		this.neCom_id = neCom_id;
	}
	public int getCom_id() {
		return com_id;
	}
	public void setCom_id(int com_id) {
		this.com_id = com_id;
	}
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public int getMem_level() {
		return mem_level;
	}
	public void setMem_level(int mem_level) {
		this.mem_level = mem_level;
	}
	public String getReCom_content() {
		return reCom_content;
	}
	public void setReCom_content(String reCom_content) {
		this.reCom_content = reCom_content;
	}
	public Timestamp getReCom_date() {
		return reCom_date;
	}
	public void setReCom_date(Timestamp reCom_date) {
		this.reCom_date = reCom_date;
	}
}
