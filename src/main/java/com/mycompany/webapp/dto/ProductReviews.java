package com.mycompany.webapp.dto;

import java.util.Date;

public class ProductReviews {
	private int boardno;
	private String userid;
	private int productno;
	private String btitle;
	private String bcontent;
	private Date bdate;
	private String borgimg;
	private String bsaveimg;
	private String bimgtype;
	

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
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public String getBorgimg() {
		return borgimg;
	}
	public void setBorgimg(String borgimg) {
		this.borgimg = borgimg;
	}
	public String getBsaveimg() {
		return bsaveimg;
	}
	public void setBsaveimg(String bsaveimg) {
		this.bsaveimg = bsaveimg;
	}
	public String getBimgtype() {
		return bimgtype;
	}
	public void setBimgtype(String bimgtype) {
		this.bimgtype = bimgtype;
	}
	
}
