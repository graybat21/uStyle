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
	private int family;
	private int parent;
	private int depth;
	private int indent;

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

	public int getFamily() {
		return family;
	}

	public void setFamily(int family) {
		this.family = family;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getIndent() {
		return indent;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}

	@Override
	public String toString() {
		return "\nQna [bno=" + bno + ", username=" + username + ", title=" + title + ", content=" + content
				+ ", category=" + category + ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", family=" + family
				+ ", parent=" + parent + ", depth=" + depth + ", indent=" + indent + "]";
	}

}
