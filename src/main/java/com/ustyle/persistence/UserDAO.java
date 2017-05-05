package com.ustyle.persistence;

import com.ustyle.domain.User;

public interface UserDAO {
	public void insert(User user); // 회원정보 입력해서 db에 입력
	public User userLogin(User user); // username, password 이용해서 전체정보 불러오기
	public boolean userAuthOk(User user); // 이메일인증 확인하여 t/f
	public void userPointInitialize(String username); // 인증에 사용한 point 칼럼 초기화
}
