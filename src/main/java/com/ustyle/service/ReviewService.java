package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Review;

public interface ReviewService 
{
	public void writeReview(Review review) throws Exception;
	public List<Review> listReply(Integer bno) throws Exception;
	public void modifyReply(Review vo) throws Exception;
	public void removeReply(Integer rno) throws Exception;
	public int selectReviewCnt(int productid) throws Exception;
	public List<Review> selectReviewList(HashMap<String, Object> reviewMap) throws Exception;
	public boolean existReview(HashMap<String, Object> reviewMap) throws Exception;
	public void deleteReviewByUsername(String username) throws Exception;
//	public List<Review> listReplyPage(Integer bno, Criteria cri) throws Exception;
	public int count(Integer bno) throws Exception;
}
