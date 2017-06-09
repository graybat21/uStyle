package com.ustyle.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Faq;
import com.ustyle.service.FaqService;
import com.ustyle.utils.PageMaker;

@Controller
public class FaqController {

	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);

	@Inject
	private FaqService service;

	@RequestMapping(value="faq.do", method=RequestMethod.GET)
	public ModelAndView Board_faq(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView("board/board_faq/FAQ");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = service.selectListCnt(map); // DB연동_ 총 갯수 구해오기
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		int countPerPage = 10;
		int countPerPaging = 5;

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		List<Faq> list = service.faqList(map);
		logger.info(list.toString());
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("faqList", list);
		mav.addObject("pageMaker", pagemaker);
		mav.setViewName("board/board_faq/FAQ");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		return mav;
	}
	@RequestMapping(value = "faqWrite.do", method = RequestMethod.GET)
	public String faqWriteForm() {
		return "board/writeForm/공지사항 글쓰기";
	}

	@RequestMapping(value = "faqWrite.do", method = RequestMethod.POST)
	public String faqWrite(Faq faq) throws Exception {
		service.faqWrite(faq);
		logger.info(faq.toString());
		return "redirect:/faq.do";
	}

	@RequestMapping("faqView.do")
	public ModelAndView faqView(@RequestParam(value = "bno") int bno) throws Exception {
		ModelAndView mav = new ModelAndView();

		Faq faq = service.faqView(bno);
		logger.info(faq.toString());
		mav.addObject("faq", faq);
		mav.setViewName("board/faqDetail/공지사항 상세보기");
		return mav;
	}
	
	@RequestMapping(value="faqModify.do", method = RequestMethod.GET)
	public String faqModifyForm() {
		return "board/writeForm/공지사항 글쓰기";
	}

	@RequestMapping(value = "faqModify.do", method = RequestMethod.POST)
	public String faqModify(Faq faq) throws Exception {
		service.faqModify(faq);
		logger.info(faq.toString());
		return "redirect:/faq.do";
	}

}
