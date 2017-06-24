package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Qna;

public interface QnaService {
	public int selectListCnt(HashMap<String, Object> map) throws Exception;

	public List<Qna> qnaList(HashMap<String, Object> map) throws Exception;

	public void qnaWrite(Qna qna) throws Exception;

	public Qna qnaView(int bno) throws Exception;

	public void qnaModify(Qna qna) throws Exception;
	public void qnaDelete(int bno) throws Exception;
	
	public int selectMyListCnt(HashMap<String,Object> map)throws Exception;
	public List<Qna> myQnaList(HashMap<String, Object> map) throws Exception;
}
