package com.mycompany.webapp.dto;

import java.util.Date;
import java.util.List;

public class Products {
	private int productno;
	private int pcategory;
	private String pname;
	private int pprice;
	private Date pregisterdate;
	private int psalescount;
	private int pstock;
	private String penable;
	private String detailimgoname;
	private String detailimgsname;
	private String detailimgtype;
	private List<ProductImgs> imglist;
	//이미지를 담을 리스트 
	//컨트롤러에서 
	
	public int getProductno() {
		return productno;
	}
	public void setProductno(int productno) {
		this.productno = productno;
	}
	public int getPcategory() {
		return pcategory;
	}
	public void setPcategory(int pcategory) {
		this.pcategory = pcategory;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public Date getPregisterdate() {
		return pregisterdate;
	}
	public void setPregisterdate(Date pregisterdate) {
		this.pregisterdate = pregisterdate;
	}
	public int getPsalescount() {
		return psalescount;
	}
	public void setPsalescount(int psalescount) {
		this.psalescount = psalescount;
	}
	public int getPstock() {
		return pstock;
	}
	public void setPstock(int pstock) {
		this.pstock = pstock;
	}
	public String getPenable() {
		return penable;
	}
	public void setPenable(String penable) {
		this.penable = penable;
	}
	public String getDetailimgoname() {
		return detailimgoname;
	}
	public void setDetailimgoname(String detailimgoname) {
		this.detailimgoname = detailimgoname;
	}
	public String getDetailimgsname() {
		return detailimgsname;
	}
	public void setDetailimgsname(String detailimgsname) {
		this.detailimgsname = detailimgsname;
	}
	public String getDetailimgtype() {
		return detailimgtype;
	}
	public void setDetailimgtype(String detailimgtype) {
		this.detailimgtype = detailimgtype;
	}
	public List<ProductImgs> getImglist() {
		return imglist;
	}
	public void setImglist(List<ProductImgs> imglist) {
		this.imglist = imglist;
	}
	@Override
	public String toString() {
		return "Products [productno=" + productno + ", pcategory=" + pcategory + ", pname=" + pname + ", pprice="
				+ pprice + ", pregisterdate=" + pregisterdate + ", psalescount=" + psalescount + ", pstock=" + pstock
				+ ", penable=" + penable + ", detailimgoname=" + detailimgoname + ", detailimgsname=" + detailimgsname
				+ ", detailimgtype=" + detailimgtype + ", imglist=" + imglist + "]";
	}
	
	
	
}
