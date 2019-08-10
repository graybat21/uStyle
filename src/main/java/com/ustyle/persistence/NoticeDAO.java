package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Notice;

public interface NoticeDAO {
	public int selectListCnt(HashMap<String, Object> map);
	public List<Notice> noticeList(HashMap<String, Object> map);
	public void noticeWrite(Notice notice);
	public Notice noticeView(int bno);
	public void viewCntPlus(int bno);
	public void noticeModify(Notice notice);
	public void noticeDelete(int bno);
}
