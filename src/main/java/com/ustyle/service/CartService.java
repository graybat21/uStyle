package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Cart;

public interface CartService {
	public void insert(Cart cart) throws Exception;
	public void update(Cart cart) throws Exception;
	public void delete(int cartno) throws Exception;
	public void deleteAll(String username) throws Exception;
	public List<HashMap<String, Object>> selectUserCartList(String username) throws Exception;
	public List<HashMap<String, Object>> selectUserItemidList(String username) throws Exception;
	public Cart selectUserCartOne(int cartno) throws Exception;
}
