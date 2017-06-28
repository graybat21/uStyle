package com.ustyle.domain;

import java.util.Date;

public class Cart {

	int cartno;
	int count;
	Date updateDate;
	String username;
	int itemid;
	
	public int getCartno() {
		return cartno;
	}
	public void setCartno(int cartno) {
		this.cartno = cartno;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	
	@Override
	public String toString() {
		return "Cart [cartno=" + cartno + ", count=" + count + ", updateDate=" + updateDate + ", username=" + username
				+ ", itemid=" + itemid + "]";
	}
}
