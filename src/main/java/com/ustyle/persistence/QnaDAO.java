package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Qna;

public interface QnaDAO {
	public int selectListCnt(HashMap<String, Object> map);

	public List<Qna> qnaList(HashMap<String, Object> map);

	 public void qnaWrite(Qna qna);
	
	 public Qna qnaView(int bno);

	public void viewCntPlus(int bno);
	public int getCurrentNo();
	
	// public void faqModify(Faq faq);
	//
	 public void qnaDelete(int bno);
}
