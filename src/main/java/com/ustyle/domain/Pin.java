package com.ustyle.domain;

public class Pin {

	private int pinno;
	private int pinboardno;
	private int productid;

	private String productimage;
	
	public int getPinno() {
		return pinno;
	}

	public void setPinno(int pinno) {
		this.pinno = pinno;
	}

	public int getPinboardno() {
		return pinboardno;
	}

	public void setPinboardno(int pinboardno) {
		this.pinboardno = pinboardno;
	}

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}

	@Override
	public String toString() {
		return "Pin [pinno=" + pinno + ", pinboardno=" + pinboardno + ", productid=" + productid + "]";
	}

}
