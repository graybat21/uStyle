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
	
//	public void insertImageUrl(String filesStr);
//
//	public User userLogin(User user); //
//
//	public boolean userAuthOk(User user); //
//
//	public void userAuthInitialize(String username); //
//
//	public int userExist(String username);
//
	public void delete(int productid);
//
//	public void delete(String username);
//
	public int getNewProductId();

//	public List<User> userList(HashMap<String, Object> map);
}
