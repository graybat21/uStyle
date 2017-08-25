package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Product;
import com.ustyle.domain.Review;

public interface ProductDAO {
	public void insert(Product product) throws Exception;
	public void writeReview(Review review) throws Exception;
	public int selectListCnt(HashMap<String, Object> map) throws Exception;
	public List<Product> productList(HashMap<String, Object> map) throws Exception;
	public List<Product> recentProductList() throws Exception;
	public List<Product> popularProductList() throws Exception;
	public int selectListCntForSubcategory(HashMap<String, Object> map) throws Exception;
	public List<Product> productListForSubcategory(HashMap<String, Object> map) throws Exception;
	public Product read(Integer productid) throws Exception;
	public String selectPictureurl(Integer productid) throws Exception;
	public String selectMainpictureurl(Integer productid) throws Exception;
	public void update(Product product) throws Exception;
	public boolean existSalesTable(int productid) throws Exception;
	public boolean existPinTable(int productid) throws Exception;
	public void delete(int productid) throws Exception;
	public void deleteItem(int productid) throws Exception;
	public int getNewProductId() throws Exception;
	
	// subcategory 에 따른 브랜드와 그 브랜드수
	public List<HashMap<String,Object>> brandListForSubcategory(String subcategory)throws Exception;
	// subcategory 의 상위카테고리와 하위카테고리
	public List<HashMap<String, Object>> subcategoryListForSubcategory(String subcategory) throws Exception;
	// subcategory 해당하는 모든 가격과 그 수
	public List<HashMap<String, Object>> priceRangeForSubcategory(String subcategory)throws Exception;
}
