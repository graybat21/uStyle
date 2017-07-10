package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.User;

public interface UserService {
	public void insert(User user) throws Exception;
	public User userLogin(User user) throws Exception;
	public boolean userAuthOk(User user) throws Exception;
	public void userAuthInitialize(String username) throws Exception;
	public int userExist(String username) throws Exception;
	public void update(User user) throws Exception;
	public void updatePoint(User user) throws Exception;
	public void delete(String username) throws Exception;
	public int selectListCnt(HashMap<String, Object> map) throws Exception;
	public List<User> userList(HashMap<String, Object> map) throws Exception;
	public User selectOneUser(String username) throws Exception;
	public int selectUserPurchaseCount(String username) throws Exception;
	public List<HashMap<String, Object>> selectUserPurchaseList(HashMap<String, Object> map) throws Exception;
	public double selectUserPointRatio(String username) throws Exception;
}
