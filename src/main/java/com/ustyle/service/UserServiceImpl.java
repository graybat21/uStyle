package com.ustyle.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public void delete(User user) throws Exception {
		dao.delete(user);
	}
	
	
}
