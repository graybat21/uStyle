package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Pin;
import com.ustyle.domain.PinBoard;
import com.ustyle.domain.PinBoardLike;

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
	public int selectListCntForUsername(String username) {
		return session.selectOne(namespace + ".selectListCntForUsername", username);
	}

	@Override
	public List<PinBoard> selectPinBoardList(HashMap<String, Object> map) {
		return session.selectList(namespace + ".selectPinBoardList", map);
	}
	
	@Override
	public boolean checkLike(HashMap<String, Object> map) {
		return session.selectOne(namespace + ".checkLike", map);
	}
	
	@Override
	public void plusLike(int pinboardno) {
		session.update(namespace + ".plusLike", pinboardno);
	}
	
	@Override
	public void addLikeList(PinBoardLike pinBoardLike) {
		session.insert(namespace + ".addLikeList", pinBoardLike);
	}
	
	@Override
	public void minusLike(int pinboardno) {
		session.update(namespace + ".minusLike", pinboardno);
	}
	
	@Override
	public void removeLikeList(PinBoardLike pinBoardLike) {
		session.insert(namespace + ".removeLikeList", pinBoardLike);
	}
	
	@Override
	public int selectLikeCnt(int pinboardno) {
		return session.selectOne(namespace + ".selectLikeCnt", pinboardno);
	}
	
	@Override
	public boolean existPin(Pin pin) {
		return session.selectOne(namespace + ".existPin", pin);
	}
	
	@Override
	public int selectPinCnt(int pinboardno) {
		return session.selectOne(namespace + ".selectPinCnt", pinboardno);
	}
	
	@Override
	public List<HashMap<String, Object>> selectPinBoardProductList(int pinboardno) {
		return session.selectList(namespace + ".selectPinBoardProductList", pinboardno);
	}
	
	@Override
	public void modifyPinBoard(PinBoard pinBoard) {
		session.update(namespace + ".modifyPinBoard", pinBoard);
	}
	
	@Override
	public void deleteAllPinBoardLike(int pinboardno) {
		session.update(namespace + ".deleteAllPinBoardLike", pinboardno);
	}
	
	@Override
	public List<Integer> selectPinBoardNoList(String username) {
		return session.selectList(namespace + ".selectPinBoardNoList", username);
	}

	@Override
	public List<PinBoard> getPinBoardList() {
		return session.selectList(namespace + ".getPinBoardList");
	}

	@Override
	public PinBoard pinBoardByNo(int pinboardno) {
		return session.selectOne(namespace + ".getPinBoardByNo", pinboardno);
	}

	// ======================================================
	@Override
	public List<PinBoard> getPinBoardMainImage(String username) {
		return session.selectList(namespace + ".getPinBoardMainImage", username);
	}

	@Override
	public void deletePinBoard(int pinboardno) {
		session.delete(namespace + ".deletePinBoard", pinboardno);
	}

	@Override
	public int selectListCnt(HashMap<String, Object> map) {
		return session.selectOne(namespace + ".selectListCnt", map);
	}
}
