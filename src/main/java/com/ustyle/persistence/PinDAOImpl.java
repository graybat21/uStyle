package com.ustyle.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Pin;

@Repository
public class PinDAOImpl implements PinDAO {

	private static String namespace = "com.ustyle.mappers.pinMapper";
	@Inject
	private SqlSession session;

	@Override
	public void insertPin(Pin pin) {
		session.insert(namespace + ".insertPin", pin);
	}

	@Override
	public List<Pin> getPins(int pinboardno) {
		return session.selectList(namespace + ".getPins", pinboardno);
	}

	@Override
	public void deletePin(int pinno) {
		session.delete(namespace+".deletePin", pinno);
	}

	@Override
	public void deleteAllPin(int pinboardno) {
		session.delete(namespace+".deleteAllPin", pinboardno);
	}

	
}
