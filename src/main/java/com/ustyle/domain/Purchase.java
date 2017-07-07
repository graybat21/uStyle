package com.ustyle.domain;

import java.util.Date;

public class Purchase {
	int purchaseid;
	String recipientname;
	String shippingaddr1;
	String shippingaddr2;
	String shippingpostcode;
	String recipientphone;
	String username;
	Date purchasedate;
	int usedpoint;
	
	public int getPurchaseid() {
		return purchaseid;
	}
	public void setPurchaseid(int purchaseid) {
		this.purchaseid = purchaseid;
	}
	public String getRecipientname() {
		return recipientname;
	}
	public void setRecipientname(String recipientname) {
		this.recipientname = recipientname;
	}
	public String getShippingaddr1() {
		return shippingaddr1;
	}
	public void setShippingaddr1(String shippingaddr1) {
		this.shippingaddr1 = shippingaddr1;
	}
	public String getShippingaddr2() {
		return shippingaddr2;
	}
	public void setShippingaddr2(String shippingaddr2) {
		this.shippingaddr2 = shippingaddr2;
	}
	public String getShippingpostcode() {
		return shippingpostcode;
	}
	public void setShippingpostcode(String shippingpostcode) {
		this.shippingpostcode = shippingpostcode;
	}
	public String getRecipientphone() {
		return recipientphone;
	}
	public void setRecipientphone(String recipientphone) {
		this.recipientphone = recipientphone;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getPurchasedate() {
		return purchasedate;
	}
	public void setPurchasedate(Date purchasedate) {
		this.purchasedate = purchasedate;
	}
	public int getUsedpoint() {
		return usedpoint;
	}
	public void setUsedpoint(int usedpoint) {
		this.usedpoint = usedpoint;
	}
	
	@Override
	public String toString() {
		return "Purchase [purchaseid=" + purchaseid + ", recipientname=" + recipientname + ", shippingaddr1="
				+ shippingaddr1 + ", shippingaddr2=" + shippingaddr2 + ", shippingpostcode=" + shippingpostcode
				+ ", recipientphone=" + recipientphone + ", username=" + username + ", purchasedate=" + purchasedate
				+ ", usedpoint=" + usedpoint + "]";
	}
}
