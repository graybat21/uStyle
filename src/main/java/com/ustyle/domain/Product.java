package com.ustyle.domain;

import java.util.Arrays;
import java.util.Date;

public class Product {
	
	private int productid;
	private String productname;
	private String description;
	private String brand;
	private String[] files;
	private String category;
	private String subcategory;
	private Date create_time;
	
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	
	@Override
	public String toString() {
		return "Product [productid=" + productid + ", productname=" + productname + ", description=" + description
				+ ", brand=" + brand + ", files=" + Arrays.toString(files) + ", category=" + category + ", subcategory="
				+ subcategory + ", create_time=" + create_time + "]";
	}
}
