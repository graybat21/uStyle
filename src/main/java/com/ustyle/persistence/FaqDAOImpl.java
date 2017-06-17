package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Faq;

@Repository
public class FaqDAOImpl implements FaqDAO {

	private static String namespace = "com.ustyle.mappers.faqMapper";
	@Inject
	private SqlSession session;

	@Override
	public int selectListCnt(HashMap<String, Object> map) {
		return session.selectOne(namespace + ".selectListCnt", map);
	}

	@Override
	public List<Faq> faqList(HashMap<String, Object> map) {
		return session.selectList(namespace + ".faqList", map);
	}

	@Override
	public void faqWrite(Faq faq) {
		session.insert(namespace + ".faqWrite", faq);
	}

	@Override
	public Faq faqView(int bno) {
		return session.selectOne(namespace + ".faqView", bno);
	}

	@Override
	public void viewCntPlus(int bno) {
		session.update(namespace + ".viewCntPlus", bno);
	}

	@Override
	public void faqModify(Faq faq) {
		session.update(namespace+".faqModify",faq);
	}

	@Override
	public void faqDelete(int bno) {
		session.delete(namespace+".faqDelete",bno);
	}

}
