package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Pin;
import com.ustyle.domain.PinBoard;

public interface PinService {
	public void createPinBoard(HashMap<String, Object> map) throws Exception;

	public List<PinBoard> getPinBoardList(String username) throws Exception;

	public void modifyPinBoardName(String pinboardname) throws Exception;

	public void deletePinBoard(int pinboardno) throws Exception;

	public List<Pin> getPins(int pinboardno) throws Exception;

	public void insertPin(Pin pin) throws Exception;

	public void deletePin(int pinno) throws Exception;
}
