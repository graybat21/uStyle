package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Product;

public interface ProductDAO {
	public void insert(Product product);
	public int selectListCnt(HashMap<String, Object> map);
	public List<Product> productList(HashMap<String, Object> map);
	public Product read(Integer pid) throws Exception;
	public String selectPictureUrl(Integer pid) throws Exception;
	public void update(Product product);
	public void delete(int productid);
	public void deleteItem(int productid);
	public int getNewProductId();
}
