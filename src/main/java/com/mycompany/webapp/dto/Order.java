package com.mycompany.webapp.dto;

import java.util.Date;

public class Order {
	private int orderNo;
	private String userId;
	private String oAddress;
	private String oReceiver;
	private String oNumber;
	private String oMessage;
	private String oMethod;
	private Date oDate;
	private String oStatus;
	private int oZipcode;
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String uid) {
		this.userId = uid;
	}
	public String getoAddress() {
		return oAddress;
	}
	public void setoAddress(String oAddress) {
		this.oAddress = oAddress;
	}
	public String getoReceiver() {
		return oReceiver;
	}
	public void setoReceiver(String oReceiver) {
		this.oReceiver = oReceiver;
	}
	public String getoNumber() {
		return oNumber;
	}
	public void setoNumber(String oNumber) {
		this.oNumber = oNumber;
	}
	public String getoMessage() {
		return oMessage;
	}
	public void setoMessage(String oMessage) {
		this.oMessage = oMessage;
	}
	public String getoMethod() {
		return oMethod;
	}
	public void setoMethod(String oMethod) {
		this.oMethod = oMethod;
	}
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}
	public String getoStatus() {
		return oStatus;
	}
	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}
	public int getoZipcode() {
		return oZipcode;
	}
	public void setoZipcode(int oZipcode) {
		this.oZipcode = oZipcode;
	}
	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", uid=" + userId + ", oAddress=" + oAddress + ", oReceiver=" + oReceiver
				+ ", oNumber=" + oNumber + ", oMessage=" + oMessage + ", oMethod=" + oMethod + ", oDate=" + oDate
				+ ", oStatus=" + oStatus + ", oZipcode=" + oZipcode + "]";
	}

	
	
	
}
