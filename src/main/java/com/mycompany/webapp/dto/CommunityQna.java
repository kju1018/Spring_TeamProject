package com.mycompany.webapp.dto;

import java.util.Date;

public class CommunityQna {
	private int boardno;
	private String userid;
	private String btitle;
	private Date bdate;
	private String bcontent;
	private int bcount;
	private int board_origin;
	private int board_re;
	
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	public int getBoard_origin() {
		return board_origin;
	}
	public void setBoard_origin(int board_origin) {
		this.board_origin = board_origin;
	}
	public int getBoard_re() {
		return board_re;
	}
	public void setBoard_re(int board_re) {
		this.board_re = board_re;
	}
}
