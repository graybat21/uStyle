package com.ustyle.persistence;

import com.ustyle.domain.User;

public interface UserDAO {
	public void insert(User user); // ȸ������ �Է��ؼ� db�� �Է�
	public User userLogin(User user); // username, password �̿��ؼ� ��ü���� �ҷ�����
	public boolean userAuthOk(User user); // �̸������� Ȯ���Ͽ� t/f
	public void userPointInitialize(String username); // ������ ����� point Į�� �ʱ�ȭ
}
