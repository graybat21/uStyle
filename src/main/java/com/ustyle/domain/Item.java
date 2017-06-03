package com.ustyle.domain;

public class Item {

	int itemid;
	String color;
	String size;
	int stock;
	int originalprice;
	int saleprice;
	int productid;
	String productname;

	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getOriginalprice() {
		return originalprice;
	}

	public void setOriginalprice(int originalprice) {
		this.originalprice = originalprice;
	}

	public int getSaleprice() {
		return saleprice;
	}

	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	@Override
	public String toString() {
		return "\nItem [itemid=" + itemid + ", color=" + color + ", size=" + size + ", stock=" + stock
				+ ", originalprice=" + originalprice + ", saleprice=" + saleprice + ", productid=" + productid
				+ ", productname=" + productname + "]";
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}
}