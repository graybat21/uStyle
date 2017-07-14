package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Grade;
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

	@Override
	public void update(User user) {
		session.update(namespace + ".update", user);
	}

	@Override
	public void updatePoint(User user) {
		session.update(namespace + ".updatePoint", user);
	}

	@Override
	public void delete(String username) {
		session.delete(namespace + ".delete", username);
	}

	@Override
	public int selectListCnt(HashMap<String,Object> map) {
		return session.selectOne(namespace + ".selectListCnt", map);
	}

	@Override
	public List<User> userList(HashMap<String, Object> map) {
		return session.selectList(namespace + ".userList", map);
	}

	@Override
	public User selectOneUser(String username) {
		return session.selectOne(namespace + ".selectUserOne", username);
	}
	
	@Override
	public void modifyAllUsersGradeInitialize() {
		session.update(namespace+".modifyAllUsersGradeInitialize");
	}

	@Override
	public void modifyAllUsersGrade(Grade grade) {
		session.update(namespace+".modifyAllUsersGrade", grade);
	}
	
	@Override
	public int selectUserPurchaseCount(String username) {
		return session.selectOne(namespace + ".selectUserPurchaseCount", username);
	}

	@Override
	public List<HashMap<String, Object>> selectUserPurchaseList(HashMap<String, Object> map) {
		return session.selectList(namespace + ".selectUserPurchaseList", map);
	}

	@Override
	public double selectUserPointRatio(String username) {
		return session.selectOne(namespace + ".selectUserPointRatio", username);
	}

}
