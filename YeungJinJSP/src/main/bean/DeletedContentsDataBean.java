package main.bean;

public class DeletedContentsDataBean {
	private int cont_id;
	private String cont_title;
	private String cont_content;
	private int mem_id;
	private String mem_nickname;
	
	public int getCont_id() {
		return cont_id;
	}
	public void setCont_id(int cont_id) {
		this.cont_id = cont_id;
	}
	public String getCont_title() {
		return cont_title;
	}
	public void setCont_title(String cont_title) {
		this.cont_title = cont_title;
	}
	public String getCont_content() {
		return cont_content;
	}
	public void setCont_content(String cont_content) {
		this.cont_content = cont_content;
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
}
