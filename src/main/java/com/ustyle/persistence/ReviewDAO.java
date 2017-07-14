package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Review;

public interface ReviewDAO 
{
	public List<Review> list(Integer bno) throws Exception;
	public void insert(Review review) throws Exception;
	public void update(Review vo) throws Exception;
	public void delete(Integer rno) throws Exception;
	public int selectReviewCnt(int productid) throws Exception;
	public List<Review> selectReviewList(HashMap<String, Object> reviewMap) throws Exception;
//	public List<Review> listPage(Integer bno, Criteria cri) throws Exception;
	public int count(Integer bno) throws Exception;
	public int getBno(Integer rno) throws Exception;
}
