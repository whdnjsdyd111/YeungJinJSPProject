package main.bean;

import java.sql.Timestamp;

public class ReportDataBean {
	private int rep_id;
	private int mem_id;
	private String mem_nickname;
	private String rep_content;
	private Timestamp rep_date;
	private int cont_id;
	private byte cont_kind;
	private String rep_kind_name;
	public int getRep_id() {
		return rep_id;
	}
	public void setRep_id(int rep_id) {
		this.rep_id = rep_id;
	}
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}
	public String getRep_content() {
		return rep_content;
	}
	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}
	public Timestamp getRep_date() {
		return rep_date;
	}
	public void setRep_date(Timestamp rep_date) {
		this.rep_date = rep_date;
	}
	public int getCont_id() {
		return cont_id;
	}
	public void setCont_id(int cont_id) {
		this.cont_id = cont_id;
	}
	public byte getCont_kind() {
		return cont_kind;
	}
	public void setCont_kind(byte cont_kind) {
		this.cont_kind = cont_kind;
	}
	public String getRep_kind_name() {
		return rep_kind_name;
	}
	public void setRep_kind_name(String rep_kind_name) {
		this.rep_kind_name = rep_kind_name;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	
	
}
