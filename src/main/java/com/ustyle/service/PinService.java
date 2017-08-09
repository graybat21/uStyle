package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Pin;
import com.ustyle.domain.PinBoard;
import com.ustyle.domain.PinBoardLike;
import com.ustyle.domain.PinBoardReply;

public interface PinService {
	public void createPinBoard(PinBoard pinBoard) throws Exception;
	public int selectListCntForUsername(String username) throws Exception;
	public List<PinBoard> selectPinBoardList(HashMap<String, Object> map) throws Exception;
	public boolean checkLike(HashMap<String, Object> map) throws Exception;
	public void plusLike(int pinboardno) throws Exception;
	public void addLikeList(PinBoardLike pinBoardLike) throws Exception;
	public void minusLike(int pinboardno) throws Exception;
	public void removeLikeList(PinBoardLike pinBoardLike) throws Exception;
	public int selectLikeCnt(int pinboardno) throws Exception;
	public boolean existPin(Pin pin) throws Exception;
	public int selectPinCnt(int pinboardno) throws Exception;
	public List<HashMap<String, Object>> selectPinBoardProductList(int pinboardno) throws Exception;
	
	public List<PinBoard> getPinBoardList();
	public List<PinBoard> getPinBoardMainImage(String username);
	public void modifyPinBoardName(PinBoard pinBoard) throws Exception;
	public void modifyPinBoardContent(PinBoard pinBoard);
	public void deletePinBoard(int pinboardno) throws Exception;
	public int selectListCnt(HashMap<String, Object> map);
	public PinBoard getPinBoardByNo(int pinboardno);
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
