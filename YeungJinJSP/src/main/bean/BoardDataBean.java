package main.bean;

import java.sql.Timestamp;

public class BoardDataBean {
	private int board_id;
	private int borad_userid;
	private int board_kind;
	private String board_title;
	private String board_content;
	private Timestamp board_date;
	private String board_images;
	private int board_reco;
	private int board_nonReco;
	private int board_readcount;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getBorad_userid() {
		return borad_userid;
	}
	public void setBorad_userid(int borad_userid) {
		this.borad_userid = borad_userid;
	}
	public int getBoard_kind() {
		return board_kind;
	}
	public void setBoard_kind(int board_kind) {
		this.board_kind = board_kind;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Timestamp getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}
	public String getBoard_images() {
		return board_images;
	}
	public void setBoard_images(String board_images) {
		this.board_images = board_images;
	}
	public int getBoard_reco() {
		return board_reco;
	}
	public void setBoard_reco(int board_reco) {
		this.board_reco = board_reco;
	}
	public int getBoard_nonReco() {
		return board_nonReco;
	}
	public void setBoard_nonReco(int board_nonReco) {
		this.board_nonReco = board_nonReco;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	
	
}
