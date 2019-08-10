package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Review;

@Repository
public class ReviewDAOImpl implements ReviewDAO
{
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.ustyle.mappers.reviewMapper";
	
	@Override
	public List<Review> list(Integer bno) throws Exception {
		return session.selectList(namespace + ".list", bno);
	}

	@Override
	public void insert(Review review) throws Exception {
		session.insert(namespace + ".insert", review);
	}

	@Override
	public int selectReviewCnt(int productid) throws Exception {
		return session.selectOne(namespace + ".selectReviewCnt", productid);
	}
	
	@Override
	public List<Review> selectReviewList(HashMap<String, Object> reviewMap) throws Exception {
		return session.selectList(namespace + ".selectReviewList", reviewMap);
	}
	
	@Override
	public boolean existReview(HashMap<String, Object> reviewMap) throws Exception {
		return session.selectOne(namespace + ".existReview", reviewMap);
	}
	
	@Override
	public void deleteReviewByUsername(String username) throws Exception {
		session.delete(namespace + ".deleteReviewByUsername", username);
	}

	@Override
	public int count(Integer bno) throws Exception {
		return session.selectOne(namespace + ".count", bno);
	}
}
