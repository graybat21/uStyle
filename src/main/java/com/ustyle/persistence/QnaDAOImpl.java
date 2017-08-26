package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Faq;
import com.ustyle.domain.Qna;
@Repository
public class QnaDAOImpl implements QnaDAO {
	private static String namespace = "com.ustyle.mappers.qnaMapper";
	@Inject
	private SqlSession session;

	@Override
	public int selectListCnt(HashMap<String, Object> map) {
		return session.selectOne(namespace + ".selectListCnt", map);
	}

	@Override
	public List<Qna> qnaList(HashMap<String, Object> map) {
		return session.selectList(namespace + ".qnaList", map);
	}

	@Override
	public void qnaWrite(Qna qna) {
		session.insert(namespace+".qnaWrite",qna);
	}

	@Override
	public Qna qnaView(int bno) {
		return session.selectOne(namespace+".qnaView", bno);
	}

	@Override
	public void viewCntPlus(int bno) {
		session.update(namespace + ".viewCntPlus", bno);
	}

	@Override
	public int getCurrentNo() {
		return session.selectOne(namespace+".getCurrentNo");
	}

	@Override
	public int getFamilyNo(int parent) {
		return session.selectOne(namespace+".getFamilyNo",parent);
	}

	@Override
	public void qnaDelete(int bno) {
		session.delete(namespace+".qnaDelete",bno);
	}

	@Override
	public int selectMyListCnt(HashMap<String, Object> map) {
		return session.selectOne(namespace+".selectMyListCnt", map);
	}

	@Override
	public List<Qna> myQnaList(HashMap<String, Object> map) {
		return session.selectList(namespace+".myQnaList",map);
	}

	@Override
	public void qnaModify(Qna qna) {
		session.update(namespace+".qnaModify",qna);
	}

}
