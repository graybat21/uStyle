package com.ustyle.service;

import com.ustyle.domain.User;

public interface UserService {
	// 회원정보 입력해서 db에 입력
	public void insert(User user) throws Exception;

	// username, password 이용해서 전체정보 불러오기
	public User userLogin(User user) throws Exception;

	// 이메일인증 확인하여 t/f
	public boolean userAuthOk(User user) throws Exception;

	// 인증에 사용한 point 칼럼 초기화
	public void userPointInitialize(String username) throws Exception;
	
	// 회원가입 시 중복되는 ID 걸러내는 메소드
	public int userExist(String username) throws Exception;
}
