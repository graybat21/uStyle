package com.ustyle.domain;

import java.util.Date;

public class PinBoardReply {

	private int pinboardreply;
	private int pinboardno;
	private String comment;
	private int ref;
	private int restep;
	private int relevel;
	private Date regdate;

	public int getPinboardreply() {
		return pinboardreply;
	}

	public void setPinboardreply(int pinboardreply) {
		this.pinboardreply = pinboardreply;
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRestep() {
		return restep;
	}

	public void setRestep(int restep) {
		this.restep = restep;
	}

	public int getRelevel() {
		return relevel;
	}

	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "\nPinBoardReply [pinboardreply=" + pinboardreply + ", pinboardno=" + pinboardno + ", comment=" + comment
				+ ", ref=" + ref + ", restep=" + restep + ", relevel=" + relevel + ", regdate=" + regdate + "]";
	}

}
