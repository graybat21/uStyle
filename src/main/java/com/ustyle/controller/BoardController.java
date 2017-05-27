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
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	
	
	@RequestMapping(value = "QA.do", method = RequestMethod.GET)
	public String Board_QA() {
		return "board/board_Q&A/Q&A";
	}

	@RequestMapping(value = "1on1.do", method = RequestMethod.GET)
	public String Board_1on1() {
		return "board/board_1on1/1on1";
	}

	@RequestMapping(value = "FAQ.do", method = RequestMethod.GET)
	public String Board_FAQ() {
		return "board/board_FAQ/FAQ";
	}

	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String Board_write() {
		return "board/writeForm/Write";
	}

}
