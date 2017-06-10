package com.ustyle.domain;

import java.util.Date;

public class Qna {

	private int bno;
	private String username;
	private String title;
	private String content;
	private String category;
	private Date regdate;
	private int viewcnt;
	private int ref;
	private int restep;
	private int relevel;

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	@Override
	public String toString() {
		return "\nQna [bno=" + bno + ", username=" + username + ", title=" + title + ", content=" + content
				+ ", category=" + category + ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", ref=" + ref
				+ ", restep=" + restep + ", relevel=" + relevel + "]";
	}

}
