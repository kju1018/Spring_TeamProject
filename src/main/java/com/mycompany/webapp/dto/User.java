package com.mycompany.webapp.dto;

import java.util.Date;

public class User {
	
	String userid;
	String upassword;
	String uname;
	String uzipcode;
	String uaddress;
	String uemail;
	String utel;
	Date ubirth;
	int uexit;
	Date ujoindate;
	int uauthority;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUzipcode() {
		return uzipcode;
	}
	public void setUzipcode(String uzipcode) {
		this.uzipcode = uzipcode;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUtel() {
		return utel;
	}
	public void setUtel(String utel) {
		this.utel = utel;
	}
	public Date getUbirth() {
		return ubirth;
	}
	public void setUbirth(Date ubirth) {
		this.ubirth = ubirth;
	}
	public int getUexit() {
		return uexit;
	}
	public void setUexit(int uexit) {
		this.uexit = uexit;
	}
	public Date getUjoindate() {
		return ujoindate;
	}
	public void setUjoindate(Date ujoindate) {
		this.ujoindate = ujoindate;
	}
	public int getUauthority() {
		return uauthority;
	}
	public void setUauthority(int uauthority) {
		this.uauthority = uauthority;
	}
	

	
	
}
