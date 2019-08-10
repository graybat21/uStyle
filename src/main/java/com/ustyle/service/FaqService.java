package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Faq;

public interface FaqService {
	public int selectListCnt(HashMap<String, Object> map) throws Exception;
	public List<Faq> faqList(HashMap<String, Object> map) throws Exception;
	public void faqWrite(Faq faq) throws Exception;
	public Faq faqView(int bno) throws Exception;
	public Faq faqViewFromAdmin(int bno) throws Exception;
	public void faqModify(Faq faq) throws Exception;
	public void faqDelete(int bno) throws Exception;
}
