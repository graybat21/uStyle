package com.ustyle.domain;

public class Sales {
	int salesno;
	int count;
	int purchaseid;
	int itemid;
	
	public int getSalesno() {
		return salesno;
	}
	public void setSalesno(int salesno) {
		this.salesno = salesno;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPurchaseid() {
		return purchaseid;
	}
	public void setPurchaseid(int purchaseid) {
		this.purchaseid = purchaseid;
	}
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	
	@Override
	public String toString() {
		return "Sales [salesno=" + salesno + ", count=" + count + ", purchaseid=" + purchaseid + ", itemid=" + itemid
				+ "]";
	}
}
