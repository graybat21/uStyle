package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ustyle.domain.Review;
import com.ustyle.persistence.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService
{
	@Inject
	private ReviewDAO dao;
	
	@Override
	public void writeReview(Review review) throws Exception {
		dao.insert(review);
	}

	@Override
	public List<Review> listReply(Integer bno) throws Exception {
		return dao.list(bno);
	}

	@Override
	public int selectReviewCnt(int productid) throws Exception {
		return dao.selectReviewCnt(productid);
	}
	
	@Override
	public List<Review> selectReviewList(HashMap<String, Object> reviewMap) throws Exception {
		return dao.selectReviewList(reviewMap);
	}
	
	@Override
	public boolean existReview(HashMap<String, Object> reviewMap) throws Exception {
		return dao.existReview(reviewMap);
	}
	
	@Override
	public void deleteReviewByUsername(String username) throws Exception {
		dao.deleteReviewByUsername(username);
	}

	@Override
	public int count(Integer bno) throws Exception {
		return dao.count(bno);
	}
}
