package main.bean;

import java.sql.Timestamp;

public class JoinBoardMemberKindDataBean {
	private int board_id;
	private String board_title;
	private Timestamp board_date;
	private int board_reco;
	private int board_nonReco;
	private int board_readcount;
	private String mem_nickname;
	private int mem_level;
	private String kind_name;
	private int kind_id;
	
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public Timestamp getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
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
	public String getKind_name() {
		return kind_name;
	}
	public void setKind_name(String kind_name) {
		this.kind_name = kind_name;
	}
	public int getKind_id() {
		return kind_id;
	}
	public void setKind_id(int kind_id) {
		this.kind_id = kind_id;
	}
	
}
