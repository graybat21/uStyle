package com.ustyle.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Faq;
import com.ustyle.domain.Notice;
import com.ustyle.domain.Qna;
import com.ustyle.service.FaqService;
import com.ustyle.service.NoticeService;
import com.ustyle.service.QnaService;
import com.ustyle.utils.PageMaker;

@Controller
@RequestMapping("/admin/board/*")
public class BoardAdminController {

	private static final Logger logger = LoggerFactory.getLogger(BoardAdminController.class);

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
		ModelAndView mav = new ModelAndView();
		
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
		mav.setViewName("board/board_notice");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		
		return mav;
	}

	@RequestMapping(value = "noticeWrite.do", method = RequestMethod.GET)
	public String noticeWriteForm() {
		return "board/noticeWrite";
	}

	@RequestMapping(value = "noticeWrite.do", method = RequestMethod.POST)
	public String noticeWrite(Notice notice) throws Exception {
		noticeService.noticeWrite(notice);
		logger.info("WRITTEN NOTICE CONTENTS = ", notice.toString());
		return "redirect:/admin/board/notice.do";
	}

	@RequestMapping("noticeView.do")
	public ModelAndView noticeView(@RequestParam(value = "bno") int bno, int page) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		Notice notice = noticeService.noticeViewFromAdmin(bno);
		mav.addObject("notice", notice);
		mav.addObject("page", page);
		mav.setViewName("board/noticeDetail");
		return mav;
	}

	@RequestMapping(value = "noticeModify.do", method = RequestMethod.GET)
	public String noticeModifyForm(@RequestParam(value = "bno") int bno, Model model) throws Exception {
		Notice notice = noticeService.noticeViewFromAdmin(bno);
		model.addAttribute("notice", notice);
		return "board/noticeWrite";
	}

	@RequestMapping(value = "noticeModify.do", method = RequestMethod.POST)
	public String noticeModify(Notice notice) throws Exception {
		noticeService.noticeModify(notice);
		return "redirect:/admin/board/notice.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "noticeDelete.do", method = RequestMethod.POST)
	public ResponseEntity<String> noticeDelete(@RequestBody Notice notice) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try 
		{
			int deleteBno = notice.getBno();
			logger.info("NOTICE TO DELETE = " + deleteBno);
			noticeService.noticeDelete(deleteBno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch ( Exception e ) 
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
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
		int page = ( pageMaker.getPage() != null ) ? pageMaker.getPage() : 1;
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
		mav.setViewName("board/board_faq");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		
		return mav;
	}
	
	@RequestMapping(value = "faqWrite.do", method = RequestMethod.GET)
	public String faqWriteForm() {
		return "board/faqWrite";
	}

	@RequestMapping(value = "faqWrite.do", method = RequestMethod.POST)
	public String faqWrite(Faq faq) throws Exception {
		faqService.faqWrite(faq);
		logger.info(faq.toString());
		return "redirect:/admin/board/faq.do";
	}
	
	@RequestMapping(value = "faqModify.do", method = RequestMethod.GET)
	public String faqModifyForm(@RequestParam(value = "bno") int bno,Model model) throws Exception {
		Faq faq = faqService.faqViewFromAdmin(bno);
		model.addAttribute("faq",faq);
		return "board/faqWrite";
	}
	
	@RequestMapping(value = "faqModify.do", method = RequestMethod.POST)
	public String faqModify(Faq faq) throws Exception {
		System.out.println(faq.getBno() + "번 글 수정");
		faqService.faqModify(faq);
		return "redirect:/admin/board/faq.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "faqDelete.do", method = RequestMethod.POST)
	public ResponseEntity<String> faqDelete(@RequestBody Faq faq) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try 
		{
			int deleteBno = faq.getBno();
			logger.info("FAQ TO DELETE = " + deleteBno);
			faqService.faqDelete(deleteBno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch ( Exception e ) 
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
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
		mav.setViewName("board/board_qna");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		return mav;
	}
	
	@RequestMapping("qnaView.do")
	public ModelAndView qnaView(@RequestParam(value = "bno") int bno, int page) throws Exception {
		ModelAndView mav = new ModelAndView();

		Qna qna = qnaService.qnaViewFromAdmin(bno);
		mav.addObject("qna", qna);
		mav.addObject("page", page);
		mav.setViewName("board/qnaDetail");
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
	
	@RequestMapping(value = "qnaReply.do", method = RequestMethod.GET)
	public String qnaReplyForm(@RequestParam(value = "parent") int parent, Model model) throws Exception {
		Qna qna = qnaService.qnaViewFromAdmin(parent);
		model.addAttribute("qna",qna);
		return "board/qnaWrite";
	}
	
	@RequestMapping(value = "qnaReply.do", method = RequestMethod.POST)
	public String qnaReply(Qna qna) throws Exception {
		qna.setUsername("administrator");
		qna.setParent(qna.getBno());
		qna.setDepth(1);
		qna.setIndent(1);
		
		qnaService.qnaWrite(qna);
		logger.info(qna.toString());
		return "redirect:/admin/board/qna.do";
	}

}
