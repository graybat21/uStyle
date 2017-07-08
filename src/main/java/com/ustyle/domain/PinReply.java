package com.ustyle.domain;

import java.util.Date;

public class PinReply {

	private int pinboardreplyno;
	private int pinboardno;
	private String comment;
	private String statuscode;
	private Date regdate;

	public int getPinboardreplyno() {
		return pinboardreplyno;
	}

	public void setPinboardreplyno(int pinboardreplyno) {
		this.pinboardreplyno = pinboardreplyno;
	}

	public int getPinboardno() {
		return pinboardno;
	}

	public void setPinboardno(int pinboardno) {
		this.pinboardno = pinboardno;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getStatuscode() {
		return statuscode;
	}

	public void setStatuscode(String statuscode) {
		this.statuscode = statuscode;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "\nPinReply [pinboardreplyno=" + pinboardreplyno + ", pinboardno=" + pinboardno + ", comment=" + comment
				+ ", statuscode=" + statuscode + ", regdate=" + regdate + "]";
	}

}
