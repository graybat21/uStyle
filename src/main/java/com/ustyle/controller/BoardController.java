package com.ustyle.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Faq;
import com.ustyle.domain.Notice;
import com.ustyle.domain.Qna;
import com.ustyle.domain.User;
import com.ustyle.service.FaqService;
import com.ustyle.service.NoticeService;
import com.ustyle.service.QnaService;
import com.ustyle.utils.PageMaker;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private NoticeService noticeService;
	
	@Inject
	private FaqService faqService;
	
	@Inject
	private QnaService qnaService;
	
/*	============================== Notice =================================		*/
	
	@RequestMapping(value = "notice.do", method = RequestMethod.GET)
	public ModelAndView noticeList(PageMaker pageMaker,
			@RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		
		ModelAndView mav = new ModelAndView("board/board_notice/Notice");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		
		int totalCnt = noticeService.selectListCnt(map); // DB연동_ 총 갯수 구해오기
		
		int page = ( pageMaker.getPage() != null ) ? pageMaker.getPage() : 1;
		pageMaker.setPage(page);
		int countPerPage = 10;
		int countPerPaging = 3;

		int first = ((pageMaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		
		List<Notice> list = noticeService.noticeList(map);
		logger.info(list.toString());
		pageMaker.setCount(totalCnt, countPerPage, countPerPaging);
		
		mav.addObject("noticeList", list);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("board/board_notice/공지사항");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		
		return mav;
	}
	
	@RequestMapping("noticeView.do")
	public ModelAndView noticeView(@RequestParam(value = "bno") int bno) throws Exception {
		ModelAndView mav = new ModelAndView();

		Notice notice = noticeService.noticeView(bno);
		logger.info(notice.toString());
		
		mav.addObject("notice", notice);
		mav.setViewName("board/noticeDetail/공지사항 상세보기");
		
		return mav;
	}
	
/*	============================== FAQ =================================	*/

	@RequestMapping(value = "faq.do", method = RequestMethod.GET)
	public ModelAndView faqList(PageMaker pageMaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		
		int totalCnt = faqService.selectListCnt(map);
		int page = pageMaker.getPage() != null ? pageMaker.getPage() : 1;
		pageMaker.setPage(page);
		int countPerPage = 10;
		int countPerPaging = 5;

		int first = ((pageMaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		
		List<Faq> list = faqService.faqList(map);
		logger.info(list.toString());
		pageMaker.setCount(totalCnt, countPerPage, countPerPaging);
		
		mav.addObject("faqList", list);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("board/board_faq/FAQ");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		
		return mav;
	}
	
/*	============================== Q&A =================================	*/
	
	@RequestMapping(value = "qna.do", method = RequestMethod.GET)
	public ModelAndView qnaList(PageMaker pageMaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		
		int totalCnt = qnaService.selectListCnt(map);

		int page = ( pageMaker.getPage() != null ) ? pageMaker.getPage() : 1;
		pageMaker.setPage(page);
		int countPerPage = 10;
		int countPerPaging = 5;
		
		int first = ((pageMaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		
		List<Qna> list = qnaService.qnaList(map);
		logger.info(list.toString());
		
		pageMaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("qnaList", list);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("board/board_qna/Q&A");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		
		return mav;
	}
	
	@RequestMapping(value = "qnaWrite.do", method = RequestMethod.GET)
	public String qnaWriteForm(HttpSession session) {
		return "board/qnaWrite/Q&A 글쓰기";
	}

	@RequestMapping(value = "qnaWrite.do", method = RequestMethod.POST)
	public String qnaWrite(Qna qna, HttpSession session) throws Exception {
		User user = (User) session.getAttribute("session_user");
		qna.setUsername(user.getUsername());
		
		logger.info(qna.toString());
		qnaService.qnaWrite(qna);
		return "redirect:/board/qna.do";
	}
	
	@RequestMapping("qnaView.do")
	public ModelAndView qnaView(@RequestParam(value = "bno") int bno, int page) throws Exception {
		ModelAndView mav = new ModelAndView();

		Qna qna = qnaService.qnaView(bno);
		
		mav.addObject("qna", qna);
		mav.addObject("page", page);
		mav.setViewName("board/qnaDetail/Q&A 상세보기");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "qnaDelete.do", method = RequestMethod.POST)
	public ResponseEntity<String> qnaDelete(@RequestBody Qna qna) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try 
		{
			int deleteBno = qna.getBno();
			logger.info("Q&A TO DELETE = " + deleteBno);
			qnaService.qnaDelete(deleteBno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch ( Exception e ) 
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value = "myQnaList.do", method = RequestMethod.GET)
	public ModelAndView myQnaList(HttpSession session, PageMaker pageMaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = qnaService.selectMyListCnt(map);
		int page = pageMaker.getPage() != null ? pageMaker.getPage() : 1;
		pageMaker.setPage(page);
		int countPerPage = 10;
		int countPerPaging = 5;
		
		int first = ((pageMaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		User user = (User) session.getAttribute("session_user");
		map.put("username", user.getUsername());
		List<Qna> list = qnaService.myQnaList(map);
		
		pageMaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		
		mav.addObject("myQnaList", list);
		mav.setViewName("user/myQnaList/My Q&A");
		return mav;
	}

	@RequestMapping(value = "qnaModify.do", method = RequestMethod.GET)
	public ModelAndView qnaModifyForm(@RequestParam(value = "bno") int bno, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		User user = (User) session.getAttribute("session_user");
		Qna qna = qnaService.qnaView(bno);
		
		if ( !qna.getUsername().equals(user.getUsername()) ) {
			mav.setViewName("redirect:/board/qnaView.do?bno=" + bno);
			return mav;
		}
		
		mav.setViewName("board/qnaModify/Q&A 수정하기");
		mav.addObject(qna);
		
		return mav;
	}
	
	@RequestMapping(value = "qnaModify.do", method = RequestMethod.POST)
	public ModelAndView qnaModify(Qna qna, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		qnaService.qnaModify(qna);
		mav.addObject(qna);
		mav.setViewName("redirect:/board/qnaView.do?bno=" + qna.getBno());
		return mav;
	}
}
