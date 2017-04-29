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

}
