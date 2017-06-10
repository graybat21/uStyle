package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ustyle.domain.Qna;
import com.ustyle.persistence.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	private QnaDAO dao;

	@Override
	public int selectListCnt(HashMap<String, Object> map) throws Exception {
		return dao.selectListCnt(map);
	}

	@Override
	public List<Qna> qnaList(HashMap<String, Object> map) throws Exception {
		return dao.qnaList(map);
	}

	@Override
	public void qnaWrite(Qna qna) throws Exception {
		
		if(qna.getRef()==0){
		qna.setRestep(dao.getCurrentNo()+1);
		}
		dao.qnaWrite(qna);
	}

	@Override
	public Qna qnaView(int bno) throws Exception {
		dao.viewCntPlus(bno);
		return dao.qnaView(bno);
	}

	@Override
	public void qnaDelete(int bno) throws Exception {
		dao.qnaDelete(bno);
	}

//	@Override
//	public void qnaModify(Qna qna) throws Exception {
//		dao.qnaModify(qna);
//	}
	
	

}
