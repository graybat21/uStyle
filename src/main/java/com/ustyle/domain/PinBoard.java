package com.ustyle.domain;

import java.util.Date;

public class PinBoard {

	private int pinboardno;
	private String username;
	private String pinboardname;
	private Date create_time;
	private String content;
	private int likecnt;
	private int mainpictureproductid;
	
	public int getPinboardno() {
		return pinboardno;
	}

	public void setPinboardno(int pinboardno) {
		this.pinboardno = pinboardno;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPinboardname() {
		return pinboardname;
	}

	public void setPinboardname(String pinboardname) {
		this.pinboardname = pinboardname;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}

	public int getMainpictureproductid() {
		return mainpictureproductid;
	}

	public void setMainpictureproductid(int mainpictureproductid) {
		this.mainpictureproductid = mainpictureproductid;
	}

	@Override
	public String toString() {
		return "PinBoard [pinboardno=" + pinboardno + ", username=" + username + ", pinboardname=" + pinboardname
				+ ", create_time=" + create_time + ", content=" + content + ", likecnt=" + likecnt
				+ ", mainpictureproductid=" + mainpictureproductid + "]";
	}
}
