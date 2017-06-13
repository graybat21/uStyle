package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Product;

public interface ProductDAO {
	public void insert(Product product) throws Exception;
	public int selectListCnt(HashMap<String, Object> map) throws Exception;
	public List<Product> productList(HashMap<String, Object> map) throws Exception;
	public int selectListCntForSubcategory(String subcategory) throws Exception;
	public List<Product> productListForSubcategory(HashMap<String, Object> map) throws Exception;
	public Product read(Integer productid) throws Exception;
	public String selectPictureUrl(Integer productid) throws Exception;
	public void update(Product product) throws Exception;
	public void delete(int productid) throws Exception;
	public void deleteItem(int productid) throws Exception;
	public int getNewProductId() throws Exception;
}
