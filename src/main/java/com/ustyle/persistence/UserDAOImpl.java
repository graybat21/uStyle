package com.ustyle.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.User;

@Repository
public class UserDAOImpl implements UserDAO {

	private static String namespace = "com.ustyle.mappers.userMapper";

	@Inject
	private SqlSession session;

	@Override
	public void insert(User user) {
		session.insert(namespace + ".insert", user);
	}

	@Override
	public User userLogin(User user) {
		return session.selectOne(namespace + ".userLogin", user);
	}

	@Override
	public boolean userAuthOk(User user) {
		return session.selectOne(namespace + ".userAuthOk", user);
	}

	@Override
	public void userAuthInitialize(String username) {
		session.update(namespace + ".userAuthInitialize", username);
	}

	@Override
	public int userExist(String username) {
		return session.selectOne(namespace + ".userExist", username);
	}

}
