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
		System.out.println(qna.getBno());
		System.out.println(qna.getFamily());
		System.out.println(qna.getParent());
		
		if(qna.getParent()==0){
			int bno = dao.getCurrentNo();
			System.out.println("부모글이 없으면 새글 입력이므로 parent = 0, family 는 bno와 같음");
			qna.setFamily(bno+1);
			
		}else{
			int parent = qna.getParent();
			System.out.println(parent);
			int family=dao.getFamilyNo(parent);
			System.out.println(family);
			System.out.println("부모글이 있으면 답변글 입력이므로 parent 는 부모글번호, family 는 부모글번호를 통해 얻은 원글의 family와 같음");
//			qna.setParent(qna.getBno());
			qna.setFamily(family);
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

	@Override
	public List<Qna> myQnaList(HashMap<String, Object> map) throws Exception {
		return dao.myQnaList(map);
	}

	@Override
	public void qnaModify(Qna qna) throws Exception {
		dao.qnaModify(qna);
	}

	
	

}
