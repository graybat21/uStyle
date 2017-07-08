package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.PinBoard;

public interface PinBoardDAO {

	public void createPinBoard(PinBoard pinBoard);

	public List<PinBoard> getPinBoardList(String username);

	public List<PinBoard> getPinBoardMainImage(String username);

	public void modifyPinBoardName(PinBoard pinBoard);

	public void deletePinBoard(int pinboardno);

	public int selectListCnt(HashMap<String, Object> map);

	public List<PinBoard> pinBoardList(HashMap<String, Object> map);
}
