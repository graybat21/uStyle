package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Cart;

@Repository
public class CartDAOImpl implements CartDAO {

	private static String namespace = "com.ustyle.mappers.cartMapper";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void insert(Cart cart) {
		session.insert(namespace + ".insert", cart);
	}
	
	@Override
	public void update(Cart cart) {
		session.update(namespace + ".update", cart);
	}
	
	@Override
	public void delete(int cartno) {
		session.delete(namespace + ".delete", cartno);
	}
	
	@Override
	public void deleteAll(String username) {
		session.delete(namespace + ".deleteAll", username);
	}	

	@Override
	public List<HashMap<String, Object>> selectUserCartList(String username) {
		return session.selectList(namespace + ".selectUserCartList", username);
	}
	
	@Override
	public List<HashMap<String, Object>> selectUserItemidList(String username) {
		return session.selectList(namespace + ".selectUserItemidList", username);
	}
	
	@Override
	public Cart selectUserCartOne(int cartno) {
		return session.selectOne(namespace + ".selectUserCartOne", cartno);
	}
}
