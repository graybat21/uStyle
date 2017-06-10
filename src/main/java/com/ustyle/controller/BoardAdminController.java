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
import com.ustyle.domain.Notice;
import com.ustyle.service.FaqService;
import com.ustyle.service.NoticeService;
import com.ustyle.utils.PageMaker;

@Controller
public class BoardAdminController {

	private static final Logger logger = LoggerFactory.getLogger(BoardAdminController.class);

	@Inject
	private NoticeService noticeService;
	@Inject
	private FaqService faqService;

	@RequestMapping(value = "/admin/notice.do", method = RequestMethod.GET)
	public ModelAndView Board_notice_admin(PageMaker pagemaker,
			@RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView("board/board_notice/Notice");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = noticeService.selectListCnt(map); // DB연동_ 총 갯수 구해오기
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		int countPerPage = 10;
		int countPerPaging = 3;

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		List<Notice> list = noticeService.noticeList(map);
		logger.info(list.toString());
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("noticeList", list);
		mav.addObject("pageMaker", pagemaker);
		mav.setViewName("board/board_notice");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		return mav;
	}

	@RequestMapping(value = "/admin/noticeWrite.do", method = RequestMethod.GET)
	public String noticeWriteFormAdmin() {
		return "board/noticeWrite";
	}

	@RequestMapping(value = "/admin/noticeWrite.do", method = RequestMethod.POST)
	public String noticeWriteAdmin(Notice notice) throws Exception {
		noticeService.noticeWrite(notice);
		logger.info(notice.toString());
		return "redirect:/admin/notice.do";
	}

	@RequestMapping("/admin/noticeView.do")
	public ModelAndView noticeView_admin(@RequestParam(value = "bno") int bno) throws Exception {
		ModelAndView mav = new ModelAndView();

		Notice notice = noticeService.noticeView(bno);
		logger.info(notice.toString());
		mav.addObject("notice", notice);
		mav.setViewName("board/noticeDetail");
		return mav;
	}

	@RequestMapping(value = "/admin/noticeModify.do", method = RequestMethod.GET)
	public String noticeModifyForm() {
		return "board/noticeWrite";
	}

	@RequestMapping(value = "/admin/noticeModify.do", method = RequestMethod.POST)
	public String noticeModify(Notice notice) throws Exception {
		noticeService.noticeModify(notice);
		logger.info(notice.toString());
		return "redirect:/admin/notice.do";
	}

	@RequestMapping(value = "/admin/faq.do", method = RequestMethod.GET)
	public ModelAndView Board_faq(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = faqService.selectListCnt(map);
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		int countPerPage = 10;
		int countPerPaging = 5;

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		List<Faq> list = faqService.faqList(map);
		logger.info(list.toString());
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("faqList", list);
		mav.addObject("pageMaker", pagemaker);
		mav.setViewName("board/board_faq");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		return mav;
	}
	@RequestMapping(value = "/admin/faqWrite.do", method = RequestMethod.GET)
	public String faqWriteForm() {
		return "board/faqWrite";
	}

	@RequestMapping(value = "/admin/faqWrite.do", method = RequestMethod.POST)
	public String faqWrite(Faq faq) throws Exception {
		faqService.faqWrite(faq);
		logger.info(faq.toString());
		return "redirect:/admin/faq.do";
	}
}
