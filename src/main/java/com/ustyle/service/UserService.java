package com.ustyle.service;

import com.ustyle.domain.User;

public interface UserService {
	// ȸ������ �Է��ؼ� db�� �Է�
	public void insert(User user) throws Exception;

	// username, password �̿��ؼ� ��ü���� �ҷ�����
	public User userLogin(User user) throws Exception;

	// �̸������� Ȯ���Ͽ� t/f
	public boolean userAuthOk(User user) throws Exception;

	// ������ ����� point Į�� �ʱ�ȭ
	public void userPointInitialize(String username) throws Exception;
}
