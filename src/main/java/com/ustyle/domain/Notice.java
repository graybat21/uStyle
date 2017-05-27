package com.ustyle.domain;

import java.util.Date;

public class Notice {

	private int bno;
	private String title;
	private String content;
	private Date regdate;
	private int viewcnt;
	private String pictureurl;


	@Override
	public String toString() {
		return "\nNotice [bno=" + bno + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", viewcnt=" + viewcnt + ", pictureurl=" + pictureurl + "]";
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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


	public String getPictureurl() {
		return pictureurl;
	}

	public void setPictureurl(String pictureurl) {
		this.pictureurl = pictureurl;
	}

}
