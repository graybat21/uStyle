package com.ustyle.persistence;

import java.util.List;

import com.ustyle.domain.PinBoardReply;

public interface PinBoardReplyDAO {

	public List<PinBoardReply> getPinBoardReplyByPinBoardNo(int pinboardno);

	public void insertPinBoardReply(PinBoardReply pinBoardReply);

	public void deletePinBoardReply(int pinboardreplyno);
	
}
