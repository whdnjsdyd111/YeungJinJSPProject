package main.bean;

import java.sql.Timestamp;

public class JoinMemberCommentDataBean {
	private int com_id;
	private int com_mem_id;
	private String com_mem_nickname;
	private int com_mem_level;
	private int com_db_id;
	private String com_content;
	private int com_reco;
	private Timestamp com_date;
	
	public int getCom_id() {
		return com_id;
	}
	public void setCom_id(int com_id) {
		this.com_id = com_id;
	}
	public int getCom_mem_id() {
		return com_mem_id;
	}
	public void setCom_mem_id(int com_mem_id) {
		this.com_mem_id = com_mem_id;
	}
	public int getCom_db_id() {
		return com_db_id;
	}
	public void setCom_db_id(int com_db_id) {
		this.com_db_id = com_db_id;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public Timestamp getCom_date() {
		return com_date;
	}
	public void setCom_date(Timestamp com_date) {
		this.com_date = com_date;
	}
	public String getCom_mem_nickname() {
		return com_mem_nickname;
	}
	public void setCom_mem_nickname(String com_mem_nickname) {
		this.com_mem_nickname = com_mem_nickname;
	}
	public int getCom_mem_level() {
		return com_mem_level;
	}
	public void setCom_mem_level(int com_mem_level) {
		this.com_mem_level = com_mem_level;
	}
	public int getCom_reco() {
		return com_reco;
	}
	public void setCom_reco(int com_reco) {
		this.com_reco = com_reco;
	}
	
}
