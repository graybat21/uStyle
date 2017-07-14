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
	public List<Review> list(Integer bno) throws Exception 
	{
		return session.selectList(namespace + ".list", bno);
	}

	@Override
	public void insert(Review review) throws Exception 
	{
		session.insert(namespace + ".insert", review);
	}

	@Override
	public void update(Review vo) throws Exception 
	{
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(Integer rno) throws Exception 
	{
		session.delete(namespace + ".delete", rno);
	}
	
	@Override
	public int selectReviewCnt(int productid) throws Exception {
		return session.selectOne(namespace + ".selectReviewCnt", productid);
	}
	
	@Override
	public List<Review> selectReviewList(HashMap<String, Object> reviewMap) throws Exception {
		return session.selectList(namespace + ".selectReviewList", reviewMap);
	}

//	@Override
//	public List<Review> listPage(Integer bno, Criteria cri) throws Exception 
//	{
//		Map<String, Object> paramMap = new HashMap<>();
//		
//		paramMap.put("bno", bno);
//		paramMap.put("cri", cri);
//		
//		return session.selectList(namespace + ".listPage", paramMap);
//	}
	
	@Override
	public int count(Integer bno) throws Exception 
	{
		return session.selectOne(namespace + ".count", bno);
	}

	@Override
	public int getBno(Integer rno) throws Exception 
	{
		return session.selectOne(namespace + ".getBno", rno);
	}

}
