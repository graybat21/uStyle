package com.ustyle.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.PinBoardReply;

@Repository
public class PinBoardReplyDAOImpl implements PinBoardReplyDAO {
	private static String namespace = "com.ustyle.mappers.pinBoardReplyMapper";
	@Inject
	private SqlSession session;

	@Override
	public List<PinBoardReply> getPinBoardReplyByPinBoardNo(int pinboardno) {
		return session.selectList(namespace + ".getPinBoardReplyByPinBoardNo", pinboardno);
	}

	@Override
	public void insertPinBoardReply(PinBoardReply pinBoardReply) {
		session.insert(namespace + ".insertPinBoardReply", pinBoardReply);
	}

	@Override
	public void deletePinBoardReply(int pinboardreplyno) {
		session.delete(namespace + ".deletePinBoardReply", pinboardreplyno);
	}

}
