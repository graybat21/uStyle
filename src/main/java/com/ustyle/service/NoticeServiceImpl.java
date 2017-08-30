package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ustyle.domain.Notice;
import com.ustyle.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO dao;

	@Override
	public int selectListCnt(HashMap<String, Object> map) throws Exception {
		return dao.selectListCnt(map);
	}

	@Override
	public List<Notice> noticeList(HashMap<String, Object> map) throws Exception {
		return dao.noticeList(map);
	}

	@Override
	public void noticeWrite(Notice notice) throws Exception {
		dao.noticeWrite(notice);
	}
	
	@Transactional
	@Override
	public Notice noticeView(int bno) throws Exception {
		dao.viewCntPlus(bno);
		return dao.noticeView(bno);
	}
	
	@Override
	public Notice noticeViewFromAdmin(int bno) throws Exception {
		return dao.noticeView(bno);
	}
	
	@Override
	public void noticeModify(Notice notice) throws Exception {
		dao.noticeModify(notice);
	}

	@Override
	public void noticeDelete(int bno) throws Exception {
		dao.noticeDelete(bno);
	}
}
