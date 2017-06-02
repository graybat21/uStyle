package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Product;

public interface ProductService {
	public void insert(Product product) throws Exception;
	public int selectListCnt(HashMap<String, Object> map) throws Exception;
	public List<Product> productList(HashMap<String, Object> map) throws Exception;
	public Product read(Integer bno) throws Exception;
	public String selectPictureurl(Integer productid) throws Exception;
	public void update(Product product) throws Exception;
	public void delete(int productid) throws Exception;
	public int getNewProductId() throws Exception;
}
