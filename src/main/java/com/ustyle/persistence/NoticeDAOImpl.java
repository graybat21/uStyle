package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Notice;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	private static String namespace = "com.ustyle.mappers.noticeMapper";

	@Inject
	private SqlSession session;

	@Override
	public int selectListCnt(HashMap<String, Object> map) {
		return session.selectOne(namespace + ".selectListCnt", map);
	}

	@Override
	public List<Notice> noticeList(HashMap<String, Object> map) {
		return session.selectList(namespace + ".noticeList", map);
	}

	@Override
	public void noticeWrite(Notice notice) {
		session.insert(namespace + ".noticeWrite", notice);
	}

	@Override
	public Notice noticeView(int bno) {
		return session.selectOne(namespace + ".noticeView", bno);
	}

	@Override
	public void viewCntPlus(int bno) {
		session.update(namespace + ".viewCntPlus", bno);
	}

	@Override
	public void noticeModify(Notice notice) {
		session.update(namespace + ".noticeModify", notice);
	}
	
	@Override
	public void noticeDelete(int bno) {
		session.delete(namespace + ".noticeDelete", bno);
	}
}
