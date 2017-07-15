package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Pin;
import com.ustyle.domain.PinBoard;
import com.ustyle.domain.PinBoardReply;

public interface PinService {
	public void createPinBoard(PinBoard pinBoard) throws Exception;

	public List<PinBoard> getPinBoardMyList(String username);

	public List<PinBoard> getPinBoardList();

	public List<PinBoard> getPinBoardMainImage(String username);

	public void modifyPinBoardName(PinBoard pinBoard) throws Exception;

	public void modifyPinBoardContent(PinBoard pinBoard);

	public void deletePinBoard(int pinboardno) throws Exception;

	public int selectListCnt(HashMap<String, Object> map);

	public List<PinBoard> pinBoardList(HashMap<String, Object> map);

	public PinBoard getPinBoardByNo(int pinboardno);

	public void plusLike(int pinboardno);
	// ===================================================================== //

	public List<Pin> getPins(int pinboardno);

	public void insertPin(Pin pin) throws Exception;

	public void deletePin(int pinno) throws Exception;

	public void deleteAllPin(int pinboardno) throws Exception;

	// ===================================================================== //

	public List<PinBoardReply> getPinBoardReplyByPinBoardNo(int pinboardno);

	public void insertPinBoardReply(PinBoardReply pinBoardReply);

	public void deletePinBoardReply(int pinboardreplyno);

}
