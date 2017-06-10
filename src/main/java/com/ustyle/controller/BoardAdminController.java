package com.ustyle.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
public class BoardAdminController {

	private static final Logger logger = LoggerFactory.getLogger(BoardAdminController.class);

	@Inject
	private NoticeService noticeService;
	@Inject
	private FaqService faqService;
	@Inject
	private QnaService qnaService;

//	============================== Notice =================================
	@RequestMapping(value = "/admin/notice.do", method = RequestMethod.GET)
	public ModelAndView Board_notice_admin(PageMaker pagemaker,
			@RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView();
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
		mav.addObject("notice", notice);
		mav.setViewName("board/noticeDetail");
		return mav;
	}

	@RequestMapping(value = "/admin/noticeModify.do", method = RequestMethod.GET)
	public String noticeModifyForm(@RequestParam(value = "bno") int bno,Model model) throws Exception {
		Notice notice = noticeService.noticeView(bno);
		model.addAttribute("notice",notice);
		return "board/noticeWrite";
	}

	@RequestMapping(value = "/admin/noticeModify.do", method = RequestMethod.POST)
	public String noticeModify(Notice notice) throws Exception {
		noticeService.noticeModify(notice);
		return "redirect:/admin/notice.do";
	}

//	============================== FAQ =================================
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
	@RequestMapping(value = "/admin/faqModify.do", method = RequestMethod.GET)
	public String faqModifyForm(@RequestParam(value = "bno") int bno,Model model) throws Exception {
		Faq faq = faqService.faqView(bno);
		model.addAttribute("faq",faq);
		return "board/faqWrite";
	}
	
	@RequestMapping(value = "/admin/faqModify.do", method = RequestMethod.POST)
	public String faqModify(Faq faq) throws Exception {
		System.out.println(faq.getBno() + "번 글 수정");
		faqService.faqModify(faq);
		return "redirect:/admin/faq.do";
	}
	@RequestMapping("/admin/faqDelete.do")
	public String faqDelete(@RequestParam(value = "bno") int bno) throws Exception {
		System.out.println(bno + "번 글 삭제");
		faqService.faqDelete(bno);
		return "redirect:/admin/faq.do";
	}
	
//	============================== Q&A =================================
	@RequestMapping(value="/admin/qna.do", method=RequestMethod.GET)
	public ModelAndView Board_qna(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = qnaService.selectListCnt(map);
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		int countPerPage = 10;
		int countPerPaging = 5;
		
		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		List<Qna> list = qnaService.qnaList(map);
		logger.info(list.toString());
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("qnaList", list);
		mav.addObject("pageMaker", pagemaker);
		mav.setViewName("board/board_qna");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		return mav;
	}
	@RequestMapping("/admin/qnaView.do")
	public ModelAndView qnaView(@RequestParam(value = "bno") int bno) throws Exception {
		ModelAndView mav = new ModelAndView();

		Qna qna=qnaService.qnaView(bno);
		mav.addObject("qna", qna);
		mav.setViewName("board/qnaDetail");
		return mav;
	}
	@RequestMapping("/admin/qnaDelete.do")
	public String qnaDelete(@RequestParam(value = "bno") int bno)throws Exception{
		qnaService.qnaDelete(bno);
		return "redirect:/admin/qna.do";
	}
	@RequestMapping(value = "/admin/qnaReply.do", method = RequestMethod.GET)
	public String qnaReplyForm(@RequestParam(value = "bno") int bno,Model model) throws Exception {
		Qna qna = qnaService.qnaView(bno);
		model.addAttribute("qna",qna);
		return "board/qnaWrite";
	}
	@RequestMapping(value = "/admin/qnaReply.do", method = RequestMethod.POST)
	public String qnaReply(Qna qna) throws Exception {
		qna.setUsername("관리자");
		qna.setRef(1);
		qna.setRestep(qna.getBno());
		qnaService.qnaWrite(qna);
		logger.info(qna.toString());
		return "redirect:/admin/qna.do";
	}

}
