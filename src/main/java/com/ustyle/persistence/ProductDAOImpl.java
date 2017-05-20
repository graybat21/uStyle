package com.ustyle.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	private static String namespace = "com.ustyle.mappers.productMapper";

	@Inject
	private SqlSession session;

	@Override
	public void insert(Product product) {
		session.insert(namespace + ".insert", product);
	}
//
//	@Override
//	public void updateImageUrl(String filesStr) {
//		session.updateImageUrl(namespace + ".insertImageUrl", filesStr);
//		
//	}

//	@Override
//	public User userLogin(User user) {
//		return session.selectOne(namespace + ".userLogin", user);
//	}
//
//	@Override
//	public boolean userAuthOk(User user) {
//		return session.selectOne(namespace + ".userAuthOk", user);
//	}
//
//	@Override
//	public void userAuthInitialize(String username) {
//		session.update(namespace + ".userAuthInitialize", username);
//	}
//
//	@Override
//	public int userExist(String username) {
//		return session.selectOne(namespace + ".userExist", username);
//	}
//
//	@Override
//	public void update(User user) {
//		session.update(namespace + ".update", user);
//	}
//
//	@Override
//	public void delete(String username) {
//		session.delete(namespace + ".delete", username);
//	}
//
//	@Override
//	public int selectListCnt() {
//		return session.selectOne(namespace + ".selectListCnt");
//	}
//
//	@Override
//	public List<User> userList(HashMap<String, Object> map) {
//		return session.selectList(namespace + ".userList", map);
//	}

}
