package com.ustyle.domain;

import java.util.Date;

public class Review {
	
	private int reviewid;
	private String contents;
	private Date regdate;
	private String username;
	private int productid;
	
	public int getReviewid() {
		return reviewid;
	}
	public void setReviewid(int reviewid) {
		this.reviewid = reviewid;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	
	@Override
	public String toString() {
		return "Review [reviewid=" + reviewid + ", contents=" + contents + ", regdate=" + regdate + ", username="
				+ username + ", productid=" + productid + "]";
	}
}
