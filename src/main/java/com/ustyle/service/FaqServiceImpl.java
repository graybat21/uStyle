package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ustyle.domain.Faq;
import com.ustyle.persistence.FaqDAO;

@Service
public class FaqServiceImpl implements FaqService {
	@Inject
	private FaqDAO dao;

	@Transactional
	@Override
	public int selectListCnt(HashMap<String, Object> map) throws Exception {
		return dao.selectListCnt(map);
	}

	@Override
	public List<Faq> faqList(HashMap<String, Object> map) throws Exception {
		return dao.faqList(map);
	}

	@Transactional
	@Override
	public void faqWrite(Faq faq) throws Exception {
		dao.faqWrite(faq);
	}

	@Override
	public Faq faqView(int bno) throws Exception {
		dao.viewCntPlus(bno);
		return dao.faqView(bno);
	}

	@Transactional
	@Override
	public void faqModify(Faq faq) throws Exception {
		dao.faqModify(faq);
	}

	@Override
	public void faqDelete(int bno) throws Exception {
		dao.faqDelete(bno);
	}
	

}
