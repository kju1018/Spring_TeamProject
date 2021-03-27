package com.mycompany.webapp.dto;

import java.util.Date;

public class OrderProduct {
	
	private int productNo;
	private int orderNo;
	private int oQuantity;
	private String pName;
	private int pPrice;
	private String iOriginalName;
	private String iSaveName;
	private String imgType;
	private String orderStatus;
	private Date orderDate;
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getoQuantity() {
		return oQuantity;
	}
	public void setoQuantity(int oQuantity) {
		this.oQuantity = oQuantity;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getiOriginalName() {
		return iOriginalName;
	}
	public void setiOriginalName(String iOriginalName) {
		this.iOriginalName = iOriginalName;
	}
	public String getiSaveName() {
		return iSaveName;
	}
	public void setiSaveName(String iSaveName) {
		this.iSaveName = iSaveName;
	}
	public String getImgType() {
		return imgType;
	}
	public void setImgType(String imgType) {
		this.imgType = imgType;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	
}
