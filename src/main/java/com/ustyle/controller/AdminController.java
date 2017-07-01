package com.ustyle.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Grade;
import com.ustyle.domain.User;
import com.ustyle.service.GradeService;
import com.ustyle.service.UserService;
import com.ustyle.utils.PageMaker;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private UserService userService;
	@Inject
	private GradeService gradeService;

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String mainForm() {
		return "main/base";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginForm() {
		return "login/loginAdmin";
	}

	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout() {
		return "login/logoutAdmin";
	}

	@RequestMapping("userList.do")
	public ModelAndView userList(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		// map.put("searchKeyword", searchKeyword);
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = userService.selectListCnt(map); // DB연동_ 총 갯수 구해오기
		int countPerPage = 3;
		int countPerPaging = 3;

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		List<User> list = userService.userList(map);
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("userList", list);
		mav.addObject("pageMaker", pagemaker);
		mav.setViewName("user/userList");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		logger.info(list.toString());
		return mav;
	}

	@RequestMapping("initializePoint.do")
	public String initializePoint(@RequestParam String username) throws Exception {
		User user = new User();
		user.setUsername(username);
		user.setPoint(0);
		userService.updatePoint(user);
		return "redirect:/admin/userList.do";
	}

	@RequestMapping("userDelete.do")
	public String userDelete(@RequestParam String username) throws Exception {
		userService.delete(username);
		return "redirect:/admin/userList.do";
	}
	
	
	@RequestMapping(value="grade.do", method=RequestMethod.GET)
	public String gradeList(Model model)throws Exception{
		List<Grade> gradeList = gradeService.selectList();
		model.addAttribute(gradeList);
		return "grade/gradeList";
	}
	@RequestMapping(value="grade.do", method=RequestMethod.POST)
	public String gradeInsert(@ModelAttribute @Valid Grade grade)throws Exception{
		gradeService.insert(grade);
		return "redirect:/admin/grade.do";
	}
	@RequestMapping(value="gradeUpdate.do", method=RequestMethod.POST)
	public String gradeUpdate(@ModelAttribute @Valid Grade grade)throws Exception{
		gradeService.update(grade);
		logger.info("grade has been successfully updated!! - " + grade.toString());
		return "redirect:/admin/grade.do";
	}
	
//	@RequestMapping(value="grade.do", method=RequestMethod.DELETE)
//	@RequestMapping(value="deleteGrade.do", method=RequestMethod.POST)
	@RequestMapping("deleteGrade.do")
	public String gradeDelete(@RequestParam int idx)throws Exception{
		gradeService.delete(idx);
		return "redirect:/admin/grade.do";
	}
}
