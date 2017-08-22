package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Pin;
import com.ustyle.domain.PinBoard;
import com.ustyle.domain.PinBoardLike;

public interface PinBoardDAO {
	public void createPinBoard(PinBoard pinBoard);
	public int selectListCnt();
	public int selectListCntForUsername(String username);
	public List<PinBoard> selectPinBoardList(HashMap<String, Object> map);
	public boolean checkLike(HashMap<String, Object> map);
	public void plusLike(int pinboardno);
	public void addLikeList(PinBoardLike pinBoardLike);
	public void minusLike(int pinboardno);
	public void removeLikeList(PinBoardLike pinBoardLike);
	public int selectLikeCnt(int pinboardno);
	public boolean existPin(Pin pin);
	public int selectPinCnt(int pinboardno);
	public List<HashMap<String, Object>> selectPinBoardProductList(int pinboardno);
	public void modifyPinBoard(PinBoard pinBoard);
	public void updatePictureurl(PinBoard pinBoard);
	public void deleteAllPinBoardLike(int pinboardno);
	public List<Integer> selectPinBoardNoList(String username);
	
	public List<PinBoard> getPinBoardList();
	public PinBoard pinBoardByNo(int pinboardno);
	public List<PinBoard> getPinBoardMainImage(String username);
	
	public void deletePinBoard(int pinboardno);
	public int selectListCnt(HashMap<String, Object> map);
}
