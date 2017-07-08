package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ustyle.domain.Pin;
import com.ustyle.domain.PinBoard;
import com.ustyle.persistence.PinBoardDAO;
import com.ustyle.persistence.PinDAO;

@Service
public class PinServiceImpl implements PinService {

	@Inject
	private PinBoardDAO pinBoardDao;
	@Inject
	private PinDAO pinDao;

	@Override
	public void createPinBoard(PinBoard pinBoard) throws Exception {
		pinBoardDao.createPinBoard(pinBoard);
	}

	@Override
	public List<PinBoard> getPinBoardList(String username) throws Exception {
		return pinBoardDao.getPinBoardList(username);
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

}
