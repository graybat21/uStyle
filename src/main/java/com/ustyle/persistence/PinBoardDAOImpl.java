package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.PinBoard;

@Repository
public class PinBoardDAOImpl implements PinBoardDAO {

	private static String namespace = "com.ustyle.mappers.pinBoardMapper";
	@Inject
	private SqlSession session;

	@Override
	public void createPinBoard(PinBoard pinBoard) {
		session.insert(namespace + ".createPinBoard", pinBoard);
	}

	@Override
	public List<PinBoard> getPinBoardList(String username) {
		return session.selectList(namespace + ".getPinBoardList", username);
	}

	@Override
	public List<PinBoard> getPinBoardMainImage(String username) {
		return session.selectList(namespace + ".getPinBoardMainImage", username);
	}

	@Override
	public void modifyPinBoardName(PinBoard pinBoard) {
		session.update(namespace + ".modifyPinBoardName", pinBoard);
	}

	@Override
	public void deletePinBoard(int pinboardno) {
		session.delete(namespace + ".deletePinBoard", pinboardno);
	}

	@Override
	public int selectListCnt(HashMap<String, Object> map) {
		return session.selectOne(namespace + ".selectListCnt", map);
	}

	@Override
	public List<PinBoard> pinBoardList(HashMap<String, Object> map) {
		return session.selectList(namespace + ".pinBoardList", map);
	}

}
