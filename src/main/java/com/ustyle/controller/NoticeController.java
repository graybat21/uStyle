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

import com.ustyle.domain.Notice;
import com.ustyle.service.NoticeService;
import com.ustyle.utils.PageMaker;

@Controller
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeService service;

	@RequestMapping(value = "notice.do", method = RequestMethod.GET)
	public ModelAndView Board_notice(PageMaker pagemaker,
			@RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView("board/board_notice/Notice");
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
		List<Notice> list = service.noticeList(map);
		logger.info(list.toString());
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("noticeList", list);
		mav.addObject("pageMaker", pagemaker);
		mav.setViewName("board/board_notice/공지사항");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		return mav;
	}

	@RequestMapping(value = "noticeWrite.do", method = RequestMethod.GET)
	public String noticeWriteForm() {
		return "board/writeForm/공지사항 글쓰기";
	}

	@RequestMapping(value = "noticeWrite.do", method = RequestMethod.POST)
	public String noticeWrite(Notice notice) throws Exception {
		service.noticeWrite(notice);
		logger.info(notice.toString());
		return "redirect:/notice.do";
	}

	@RequestMapping("noticeView.do")
	public ModelAndView noticeView(@RequestParam(value = "bno") int bno) throws Exception {
		ModelAndView mav = new ModelAndView();

		Notice notice = service.noticeView(bno);
		logger.info(notice.toString());
		mav.addObject("notice", notice);
		mav.setViewName("board/noticeDetail/공지사항 상세보기");
		return mav;
	}
	
	@RequestMapping(value="noticeModify.do", method = RequestMethod.GET)
	public String noticeModifyForm() {
		return "board/noticeWrite/공지사항 글쓰기";
	}

	@RequestMapping(value = "noticeModify.do", method = RequestMethod.POST)
	public String noticeModify(Notice notice) throws Exception {
		service.noticeModify(notice);
		logger.info(notice.toString());
		return "redirect:/notice.do";
	}


}
