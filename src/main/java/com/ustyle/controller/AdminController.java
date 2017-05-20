package com.ustyle.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.User;
import com.ustyle.service.UserService;
import com.ustyle.utils.PageMaker;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Inject
	private UserService service;

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String mainForm() {

		return "item/base";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "login/loginAdmin";
	}

	// @RequestMapping(value = "login.do", method = RequestMethod.POST)
	// public String login(HttpServletRequest request, User user) throws
	// Exception {
	//
	// try {
	//
	//
	// } catch (NullPointerException e) {
	// return "user/loginError/LOGIN ERROR";
	// }
	// }

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout() {
		return "login/logoutAdmin";
	}

	@RequestMapping("userList.do")
	public ModelAndView userList(PageMaker pagemaker, String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("얍얍");
		// map.put("searchKeyword", searchKeyword);
		int page = 1;
		int totalCnt = 0;
		int countPerPage = 5;
		int countPerPaging = 3;

		page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);

		totalCnt = service.selectListCnt(); // DB연동_ 총 갯수 구해오기
		pagemaker.setCount(totalCnt, countPerPaging);

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);

		List<User> list = service.userList(map);
		mav.addObject("userList", list);
		mav.addObject("userPageMaker", pagemaker);
		mav.setViewName("user/userList");

		logger.info(list.toString());
		return mav;
	}
}
