package com.ustyle.domain;

public class PinBoardLike {
	int likeno;
	int pinboardno;
	String username;
	
	public int getLikeno() {
		return likeno;
	}
	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}
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

	@Override
	public String toString() {
		return "PinBoardLike [likeno=" + likeno + ", pinboardno=" + pinboardno + ", username=" + username + "]";
	}
}
