package com.ustyle.domain;

import java.util.Date;

public class PinBoard {

	private int pinboardno;
	private String username;
	private String pinboardname;
	private Date create_time;
	private String content;
	private int likecnt;
	private String release;

	private String mainpictureurl;

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

	public String getRelease() {
		return release;
	}

	public void setRelease(String release) {
		this.release = release;
	}

	public String getMainpictureurl() {
		return mainpictureurl;
	}

	public void setMainpictureurl(String mainpictureurl) {
		this.mainpictureurl = mainpictureurl;
	}

	@Override
	public String toString() {
		return "\nPinBoard [pinboardno=" + pinboardno + ", username=" + username + ", pinboardname=" + pinboardname
				+ ", create_time=" + create_time + ", content=" + content + ", likecnt=" + likecnt + ", release="
				+ release + "]";
	}

}
