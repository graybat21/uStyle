package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.User;

public interface UserDAO {
	public void insert(User user); //

	public User userLogin(User user); //

	public boolean userAuthOk(User user); //

	public void userAuthInitialize(String username); //

	public int userExist(String username);

	public void update(User user);
	public void updatePoint(User user);

	public void delete(String username);

	public int selectListCnt();

	public List<User> userList(HashMap<String, Object> map);
}
