package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ustyle.domain.Grade;
import com.ustyle.domain.User;
import com.ustyle.persistence.ReviewDAO;
import com.ustyle.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO userDao;
	
	@Inject
	private ReviewDAO reviewDao;
	
	@Inject 
	private QnaService qnaService;
	
	@Inject
	private PinService pinService;

	@Override
	public void insert(User user) throws Exception {
		userDao.insert(user);
	}

	@Override
	public User userLogin(User user) throws Exception {
		return userDao.userLogin(user);
	}

	@Override
	public boolean userAuthOk(User user) throws Exception {
		return userDao.userAuthOk(user);
	}

	@Override
	public void userAuthInitialize(String username) throws Exception {
		userDao.userAuthInitialize(username);
	}
	
	@Override
	public int userExist(User user) throws Exception {
		return userDao.userExist(user);
	}
	
	@Override
	public HashMap<String, Object> selectUserInfo(String username) throws Exception {
		return userDao.selectUserInfo(username);
	}
	
	@Override
	public void update(User user) throws Exception {
		userDao.update(user);
	}
	
	@Override
	public void updatePoint(User user) throws Exception {
		userDao.updatePoint(user);
	}
	
	@Override
	public void updateTemporaryPassword(User user) throws Exception {
		userDao.updateTemporaryPassword(user);
	}

	@Transactional
	@Override
	public void delete(String username) throws Exception {
		reviewDao.deleteReviewByUsername(username);
		qnaService.qnaDeleteByUsername(username);;
		pinService.deletePinBoardByUsername(username);
		userDao.delete(username);
	}

	@Override
	public int selectListCnt(HashMap<String, Object> map) throws Exception {
		return userDao.selectListCnt(map);
	}

	@Override
	public List<User> userList(HashMap<String, Object> map) throws Exception {
		return userDao.userList(map);
	}
	
	@Override
	public User selectOneUser(String username) throws Exception {
		return userDao.selectOneUser(username);
	}
	
	@Override
	public void modifyAllUsersGradeInitialize() {
		userDao.modifyAllUsersGradeInitialize();
	}

	@Override
	public void modifyAllUsersGrade(Grade grade) {
		userDao.modifyAllUsersGrade(grade);
	}
	
	@Override
	public int selectUserPurchaseCount(String username) throws Exception {
		return userDao.selectUserPurchaseCount(username);
	}

	@Override
	public List<HashMap<String, Object>> selectUserPurchaseList(HashMap<String, Object> map) throws Exception {
		return userDao.selectUserPurchaseList(map);
	}

	@Override
	public double selectUserPointRatio(String username) throws Exception {
		return userDao.selectUserPointRatio(username);
	}
}
