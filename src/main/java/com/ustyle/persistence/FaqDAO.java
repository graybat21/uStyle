package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Faq;

public interface FaqDAO {
	public int selectListCnt(HashMap<String, Object> map);
	public List<Faq> faqList(HashMap<String, Object> map);
	public void faqWrite(Faq faq);
	public Faq faqView(int bno);
	public void viewCntPlus(int bno);
	public void faqModify(Faq faq);
	public void faqDelete(int bno);
}
