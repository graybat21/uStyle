package com.ustyle.domain;

import java.util.Date;

public class PinBoard {

	private int pinboardno;
	private String username;
	private String pinboardname;
	private Date create_time;

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

	@Override
	public String toString() {
		return "PinBoard [pinboardno=" + pinboardno + ", username=" + username + ", pinboardname=" + pinboardname
				+ ", create_time=" + create_time + "]";
	}

}
