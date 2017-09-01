package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Grade;
import com.ustyle.domain.User;

public interface UserDAO {
	public void insert(User user);
	public User userLogin(User user);
	public boolean userAuthOk(User user);
	public void userAuthInitialize(String username);
	public int userExist(User user);
	public HashMap<String, Object> selectUserInfo(String username);
	public void update(User user);
	public void updatePoint(User user);
	public void updateTemporaryPassword(User user);
	public void delete(String username);
	public int selectListCnt(HashMap<String, Object> map);
	public List<User> userList(HashMap<String, Object> map);
	public User selectOneUser(String user);
	public int selectUserPurchaseCount(String username);
	public void modifyAllUsersGradeInitialize();
	public void modifyAllUsersGrade(Grade grade);
	public List<HashMap<String, Object>> selectUserPurchaseList(HashMap<String, Object> map);
	public double selectUserPointRatio(String username);
}
