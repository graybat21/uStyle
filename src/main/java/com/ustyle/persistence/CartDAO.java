package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Cart;

public interface CartDAO {
	public void insert(Cart cart);
	public void update(Cart cart);
	public void delete(int cartno);
	public void deleteAll(String username);
	public List<HashMap<String, Object>> selectUserCartList(String username);
	public List<HashMap<String, Object>> selectUserItemidList(String username);
	public Cart selectUserCartOne(int cartno);
}
