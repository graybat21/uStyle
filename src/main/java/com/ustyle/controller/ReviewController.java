package com.ustyle.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ustyle.domain.Review;
import com.ustyle.service.ReviewService;
import com.ustyle.utils.PageMaker;

@RestController
@RequestMapping("/reviews")
public class ReviewController 
{
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Inject
	private ReviewService service;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody Review review)
	{
		ResponseEntity<String> entity = null;
		
		try
		{
			service.writeReview(review);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch ( Exception e )
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<Review>> list(@PathVariable("bno") Integer bno)
	{
		ResponseEntity<List<Review>> entity = null;
		
		try
		{
			entity = new ResponseEntity<>(service.listReply(bno), HttpStatus.OK);
		}
		catch ( Exception e )
		{
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody Review vo)
	{
		ResponseEntity<String> entity = null;
		
		try
		{
//			vo.setRno(rno);
			service.modifyReply(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch ( Exception e )
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{rno}", method = { RequestMethod.DELETE })
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno)
	{
		ResponseEntity<String> entity = null;
		
		try
		{
			service.removeReply(rno);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch ( Exception e )
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "/{productid}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(
			@PathVariable("productid") Integer productid, @PathVariable("page") Integer page)
	{
		ResponseEntity<Map<String, Object>> entity = null;
		
		try
		{
//			Criteria cri = new Criteria();
//			cri.setPage(page);
//			
			PageMaker pagemaker = new PageMaker();
			
			int pagecnt = 5;		// 상세페이지를 로드할 때, 가장 최근에 작성한 다섯개의 리뷰만 보여지도록 함.
			int countPerPaging = 10;
			int start = (page - 1) * pagecnt;
			
			pagemaker.setPage(page);
//			pageMaker.setCri(cri);
			
			int totalReviewCnt = service.selectReviewCnt(productid); // DB연동_ 총 갯수 구해오기
			logger.info("totalReviewCnt = " + totalReviewCnt);
			pagemaker.setCount(totalReviewCnt, pagecnt, countPerPaging);
			
			HashMap<String, Object> reviewMap = new HashMap<String, Object>();
			
			reviewMap.put("productid", productid);
			reviewMap.put("start", start);
			reviewMap.put("pagecnt", pagecnt);
			
			List<Review> reviewList = service.selectReviewList(reviewMap);
			
			reviewMap.put("reviewList", reviewList);
			reviewMap.put("pageMaker", pagemaker);
			
			entity = new ResponseEntity<Map<String, Object>>(reviewMap, HttpStatus.OK);
		}
		catch ( Exception e )
		{
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
