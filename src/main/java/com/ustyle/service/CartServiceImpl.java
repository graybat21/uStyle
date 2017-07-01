package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ustyle.domain.Cart;
import com.ustyle.persistence.CartDAO;

@Service
public class CartServiceImpl implements CartService {
	
	@Inject
	private CartDAO dao;
	
	@Override
	public void insert(Cart cart) throws Exception {
		dao.insert(cart);
	}
	
	@Override
	public void update(Cart cart) throws Exception {
		dao.update(cart);
	}
	
	@Override
	public void delete(int cartno) throws Exception {
		dao.delete(cartno);
	}
	
	@Override
	public void deleteAll(String username) throws Exception {
		dao.deleteAll(username);
	}

	@Override
	public List<HashMap<String, Object>> selectUserCartList(String username) throws Exception {
		return dao.selectUserCartList(username);
	}
	
	@Override
	public List<HashMap<String, Object>> selectUserItemidList(String username) throws Exception {
		return dao.selectUserItemidList(username);
	}

	@Override
	public Cart selectUserCartOne(int cartno) throws Exception {
		return dao.selectUserCartOne(cartno);
	}
}
