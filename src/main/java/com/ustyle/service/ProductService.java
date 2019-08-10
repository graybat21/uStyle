package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Product;
import com.ustyle.domain.Review;

public interface ProductService {
	public void insert(Product product) throws Exception;
	public void writeReview(Review review) throws Exception;
	public int selectListCnt(HashMap<String, Object> map) throws Exception;
	public List<Product> productList(HashMap<String, Object> map) throws Exception;
	public List<Product> recentProductList() throws Exception;
	public List<Product> popularProductList() throws Exception;
	public int selectListCntForSubcategory(HashMap<String, Object> map) throws Exception;
	public List<Product> productListForSubcategory(HashMap<String, Object> map) throws Exception;
	public int selectListCntForProductname(HashMap<String, Object> map) throws Exception;
	public List<Product> productListForProductname(HashMap<String, Object> map) throws Exception;
	public Product read(Integer productid) throws Exception;
	public String selectPictureurl(Integer productid) throws Exception;
	public String selectMainpictureurl(Integer productid) throws Exception;
	public void update(Product product) throws Exception;
	public boolean existSalesAndPinTable(int productid) throws Exception;
	public void delete(int productid) throws Exception;
	public int getNewProductId() throws Exception;
	
	public List<HashMap<String,Object>> brandListForSubcategory(String subcategory)throws Exception;
	public List<HashMap<String,Object>> subcategoryListForSubcategory(String subcategory)throws Exception;
	public List<HashMap<String,Object>> priceRangeForSubcategory(String subcategory)throws Exception;
	
}
