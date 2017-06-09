package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Notice;

public interface NoticeService {
	public int selectListCnt(HashMap<String, Object> map) throws Exception;

	public List<Notice> noticeList(HashMap<String, Object> map) throws Exception;

	public void noticeWrite(Notice notice) throws Exception;

	public Notice noticeView(int bno) throws Exception;
	
	public void noticeModify(Notice notice) throws Exception;
}
