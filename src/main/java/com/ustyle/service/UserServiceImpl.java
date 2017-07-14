package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ustyle.domain.Grade;
import com.ustyle.domain.User;
import com.ustyle.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;

	@Transactional
	@Override
	public void insert(User user) throws Exception {
		dao.insert(user);
	}

	@Transactional
	@Override
	public User userLogin(User user) throws Exception {
		return dao.userLogin(user);
	}

	@Transactional
	@Override
	public boolean userAuthOk(User user) throws Exception {
		return dao.userAuthOk(user);
	}

	@Override
	public void userAuthInitialize(String username) throws Exception {
		dao.userAuthInitialize(username);
	}
	
	@Transactional
	@Override
	public int userExist(String username) throws Exception {
		return dao.userExist(username);
	}
	
	@Transactional
	@Override
	public void update(User user) throws Exception {
		dao.update(user);
	}
	
	@Transactional
	@Override
	public void updatePoint(User user) throws Exception {
		dao.updatePoint(user);
	}

	@Transactional
	@Override
	public void delete(String username) throws Exception {
		dao.delete(username);
	}

	@Override
	public int selectListCnt(HashMap<String, Object> map) throws Exception {
		return dao.selectListCnt(map);
	}

	@Override
	public List<User> userList(HashMap<String, Object> map) throws Exception {
		return dao.userList(map);
	}
	
	@Override
	public User selectOneUser(String username) throws Exception {
		return dao.selectOneUser(username);
	}
	
	@Override
	public void modifyAllUsersGradeInitialize() {
		dao.modifyAllUsersGradeInitialize();
	}

	@Override
	public void modifyAllUsersGrade(Grade grade) {
		dao.modifyAllUsersGrade(grade);
	}
	
	@Override
	public int selectUserPurchaseCount(String username) throws Exception {
		return dao.selectUserPurchaseCount(username);
	}

	@Override
	public List<HashMap<String, Object>> selectUserPurchaseList(HashMap<String, Object> map) throws Exception {
		return dao.selectUserPurchaseList(map);
	}

	@Override
	public double selectUserPointRatio(String username) throws Exception {
		return dao.selectUserPointRatio(username);
	}
}
