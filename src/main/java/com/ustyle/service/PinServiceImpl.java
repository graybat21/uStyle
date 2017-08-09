package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ustyle.domain.Pin;
import com.ustyle.domain.PinBoard;
import com.ustyle.domain.PinBoardLike;
import com.ustyle.domain.PinBoardReply;
import com.ustyle.persistence.PinBoardDAO;
import com.ustyle.persistence.PinBoardReplyDAO;
import com.ustyle.persistence.PinDAO;

@Service
public class PinServiceImpl implements PinService {

	@Inject
	private PinBoardDAO pinBoardDao;
	@Inject
	private PinDAO pinDao;
	@Inject
	private PinBoardReplyDAO pinBoardReplyDao;

	@Override
	public void createPinBoard(PinBoard pinBoard) throws Exception {
		pinBoardDao.createPinBoard(pinBoard);
	}
	
	@Override
	public int selectListCntForUsername(String username) throws Exception {
		return pinBoardDao.selectListCntForUsername(username);
	}
	
	@Override
	public List<PinBoard> selectPinBoardList(HashMap<String, Object> map) throws Exception {
		return pinBoardDao.selectPinBoardList(map);
	}
	
	@Override
	public boolean checkLike(HashMap<String, Object> map) throws Exception {
		return pinBoardDao.checkLike(map);
	}
	
	@Override
	public void plusLike(int pinboardno) throws Exception {
		pinBoardDao.plusLike(pinboardno);
	}
	
	@Override
	public void addLikeList(PinBoardLike pinBoardLike) throws Exception {
		pinBoardDao.addLikeList(pinBoardLike);
	}
	
	@Override
	public void minusLike(int pinboardno) throws Exception {
		pinBoardDao.minusLike(pinboardno);
	}
	
	@Override
	public void removeLikeList(PinBoardLike pinBoardLike) throws Exception {
		pinBoardDao.removeLikeList(pinBoardLike);
	}
	
	@Override
	public int selectLikeCnt(int pinboardno) throws Exception {
		return pinBoardDao.selectLikeCnt(pinboardno);
	}
	
	@Override
	public boolean existPin(Pin pin) throws Exception {
		return pinBoardDao.existPin(pin);
	}
	
	@Override
	public int selectPinCnt(int pinboardno) throws Exception {
		return pinBoardDao.selectPinCnt(pinboardno);
	}
	
	@Override
	public List<HashMap<String, Object>> selectPinBoardProductList(int pinboardno) throws Exception {
		return pinBoardDao.selectPinBoardProductList(pinboardno);
	}
	
	@Override
	public List<PinBoard> getPinBoardList(){
		return pinBoardDao.getPinBoardList();
	}

	@Override
	public List<PinBoard> getPinBoardMainImage(String username) {
		return pinBoardDao.getPinBoardMainImage(username);
	}

	@Override
	public void modifyPinBoardName(PinBoard pinBoard) throws Exception {
		pinBoardDao.modifyPinBoardName(pinBoard);
	}

	@Override
	public void modifyPinBoardContent(PinBoard pinBoard) {
		pinBoardDao.modifyPinBoardContent(pinBoard);
	}

	@Override
	public void deletePinBoard(int pinboardno) throws Exception {
		 pinBoardDao.deletePinBoard(pinboardno);
	}

	@Override
	public int selectListCnt(HashMap<String, Object> map) {
		return pinBoardDao.selectListCnt(map);
	}

	@Override
	public PinBoard getPinBoardByNo(int pinboardno) {
		return pinBoardDao.pinBoardByNo(pinboardno);
	}

	//	=============================================


	@Override
	public List<Pin> getPins(int pinboardno) {
		 return pinDao.getPins(pinboardno);
	}

	@Override
	public void insertPin(Pin pin) throws Exception {
		 pinDao.insertPin(pin);
	}

	@Override
	public void deletePin(int pinno) throws Exception {
		 pinDao.deletePin(pinno);
	}
	@Override
	public void deleteAllPin(int pinboardno) throws Exception {
		pinDao.deleteAllPin(pinboardno);
	}


//	=============================================
	
	@Override
	public List<PinBoardReply> getPinBoardReplyByPinBoardNo(int pinboardno) {
		return pinBoardReplyDao.getPinBoardReplyByPinBoardNo(pinboardno);
	}

	@Override
	public void insertPinBoardReply(PinBoardReply pinBoardReply) {
		pinBoardReplyDao.insertPinBoardReply(pinBoardReply);
	}

	@Override
	public void deletePinBoardReply(int pinboardreplyno) {
		pinBoardReplyDao.deletePinBoardReply(pinboardreplyno);
	}
	
}
