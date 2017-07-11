package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ustyle.domain.Review;
import com.ustyle.persistence.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService
{
	@Inject
	private ReviewDAO dao;
	
	@Transactional
	@Override
	public void writeReview(Review review) throws Exception 
	{
		dao.insert(review);
	}

	@Override
	public List<Review> listReply(Integer bno) throws Exception 
	{
		return dao.list(bno);
	}

	@Override
	public void modifyReply(Review vo) throws Exception 
	{
		dao.update(vo);
	}
	
	@Transactional
	@Override
	public void removeReply(Integer rno) throws Exception 
	{
		int bno = dao.getBno(rno);
		dao.delete(rno);
	}
	
	@Transactional
	@Override
	public int selectReviewCnt(int productid) throws Exception {
		return dao.selectReviewCnt(productid);
	}
	
	@Transactional
	@Override
	public List<Review> selectReviewList(HashMap<String, Object> reviewMap) throws Exception {
		return dao.selectReviewList(reviewMap);
	}

//	@Override
//	public List<Review> listReplyPage(Integer bno, Criteria cri) throws Exception 
//	{
//		return dao.listPage(bno, cri);
//	}

	@Override
	public int count(Integer bno) throws Exception 
	{
		return dao.count(bno);
	}
	
}
