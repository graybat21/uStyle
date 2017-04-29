package com.project.uStyle;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOimpl implements UserDAO {

		String namespace = "mappers.userMapper.";

		@Autowired
		SqlSessionTemplate session;

		@Override
		public void insert(User user) {
			session.insert(namespace + "insert", user);
		}

}
