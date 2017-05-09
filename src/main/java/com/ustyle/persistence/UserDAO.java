package com.ustyle.persistence;

import com.ustyle.domain.User;

public interface UserDAO {
	public void insert(User user); // 
	public User userLogin(User user); //
	public boolean userAuthOk(User user); // 
	public void userAuthInitialize(String username); // 
	public int userExist(String username);
	public void update(User user);
}
