package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ustyle.domain.Pin;
import com.ustyle.domain.PinBoard;
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
	public List<PinBoard> getPinBoardMyList(String username){
		return pinBoardDao.getPinBoardMyList(username);
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
	public List<PinBoard> pinBoardList(HashMap<String, Object> map) {
		return pinBoardDao.pinBoardList(map);
	}

	@Override
	public PinBoard getPinBoardByNo(int pinboardno) {
		return pinBoardDao.pinBoardByNo(pinboardno);
	}
	
	@Override
	public void plusLike(int pinboardno) {
		pinBoardDao.plusLike(pinboardno);
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
