package com.ustyle.service;

import com.ustyle.domain.User;

public interface UserService {
	public void insert(User user) throws Exception;
	public User userLogin(User user) throws Exception;
	public boolean userAuthOk(User user) throws Exception;
	public void userAuthInitialize(String username) throws Exception;
	public int userExist(String username) throws Exception;
	public void update(User user) throws Exception;
	public void delete(String username) throws Exception;
	
}
