package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Product;

public interface ProductService {
	public void insert(Product product) throws Exception;
	public int selectListCnt(HashMap<String, Object> map) throws Exception;

	public List<Product> productList(HashMap<String, Object> map) throws Exception;

//	public User userLogin(User user) throws Exception;
//
//	public boolean userAuthOk(User user) throws Exception;
//
//	public void userAuthInitialize(String username) throws Exception;
//
//	public int userExist(String username) throws Exception;
//
	public void delete(int productid) throws Exception;
//
	public int getNewProductId() throws Exception;
//
//	public List<User> userList(HashMap<String, Object> map) throws Exception;

}
