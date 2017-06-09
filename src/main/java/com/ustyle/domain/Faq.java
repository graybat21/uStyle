package com.ustyle.domain;

import java.util.Date;

public class Faq {

	private int bno;
	private String content;
	private Date regdate;
	private int viewcnt;
	private String comment;
	
	@Override
	public String toString() {
		return "\nFaq [bno=" + bno + ", content=" + content + ", regdate=" + regdate + ", viewcnt=" + viewcnt
				+ ", comment=" + comment + "]";
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
