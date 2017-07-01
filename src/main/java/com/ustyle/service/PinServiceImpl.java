package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ustyle.domain.Pin;
import com.ustyle.domain.PinBoard;
import com.ustyle.persistence.PinBoardDAO;

@Service
public class PinServiceImpl implements PinService {

	@Inject
	private PinBoardDAO pinBoardDao;
	// @Inject
	// private PinDAO pinDao;

	@Override
	public void createPinBoard(HashMap<String, Object> map) throws Exception {
		pinBoardDao.createPinBoard(map);
	}

	@Override
	public List<PinBoard> getPinBoardList(String username) throws Exception {
		return pinBoardDao.getPinBoardList(username);
	}

	@Override
	public void modifyPinBoardName(PinBoard pinBoard) throws Exception {
		pinBoardDao.modifyPinBoardName(pinBoard);
	}

	@Override
	public void deletePinBoard(int pinboardno) throws Exception {
//		 pinDao.deletePins(pinboardno);
		 pinBoardDao.deletePinBoard(pinboardno);
	}

	@Override
	public List<Pin> getPins(int pinboardno) throws Exception {
		// return pinDao.getPins(pinboardno);
		return null;
	}

	@Override
	public void insertPin(Pin pin) throws Exception {
		// pinDao.insertPin(pin);
	}

	@Override
	public void deletePin(int pinno) throws Exception {
		// pinDao.deletePin(pinno);
	}

}
