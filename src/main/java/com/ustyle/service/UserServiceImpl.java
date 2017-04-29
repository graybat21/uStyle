package com.ustyle.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ustyle.domain.User;
import com.ustyle.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService
{
	
	@Inject
	private UserDAO dao;
	
	@Transactional
	@Override
	public void insert(User user) throws Exception 
	{
		dao.insert(user);
		
	}

	
	
}
