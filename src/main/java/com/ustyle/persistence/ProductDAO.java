package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Product;

public interface ProductDAO {
	public void insert(Product product);
	public int selectListCnt(HashMap<String, Object> map);
	public List<Product> productList(HashMap<String, Object> map);
	public List<Product> productListForSubcategory(String subcategory);
	public Product read(Integer productid) throws Exception;
	public String selectPictureUrl(Integer productid) throws Exception;
	public void update(Product product);
	public void delete(int productid);
	public void deleteItem(int productid);
	public int getNewProductId();
}
