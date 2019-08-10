package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ustyle.domain.Qna;
import com.ustyle.persistence.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService {
	
	private static final Logger logger = LoggerFactory.getLogger(QnaService.class);

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
	
	@Transactional
	@Override
	public void qnaWrite(Qna qna) throws Exception {
		
		if ( qna.getParent() == 0 ) {
			logger.info("부모글이 없으면 새글 입력이므로 parent = 0, family는 bno와 같음");

			dao.qnaWrite(qna);
			int bno = qna.getBno();

			logger.info("BNO = " + bno);
			dao.updateFamilyNo(qna);
		}
		else {
			int parent = qna.getParent();
			int family = dao.getFamilyNo(parent);
			
			logger.info("부모글이 있으면 답변글 입력이므로 parent는 부모글번호, family는 부모글번호를 통해 얻은 원글의 family와 같음");
			qna.setFamily(family);
			dao.qnaWrite(qna);
		}
	}

	@Transactional
	@Override
	public Qna qnaView(int bno) throws Exception {
		dao.viewCntPlus(bno);
		return dao.qnaView(bno);
	}
	
	@Override
	public Qna qnaViewFromAdmin(int bno) throws Exception {
		return dao.qnaView(bno);
	}
	
	@Override
	public void qnaDelete(int bno) throws Exception {
		dao.qnaDelete(bno);
	}
	
	@Override
	public void qnaDeleteByUsername(String username) throws Exception {
		List<Integer> bnoList = dao.selectBnoListByUsername(username);
		
		if ( !(bnoList.isEmpty()) ) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bnoList", bnoList);
			
			dao.qnaDeleteByUsername(map);
		}
	}
	
	@Override
	public int selectMyListCnt(HashMap<String, Object> map) throws Exception {
		return dao.selectMyListCnt(map);
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
