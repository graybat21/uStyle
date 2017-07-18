package com.ustyle.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
import com.ustyle.domain.PinBoard;
import com.ustyle.domain.User;
import com.ustyle.service.GradeService;
import com.ustyle.service.PinService;
import com.ustyle.service.SalesService;
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
	@Inject
	private SalesService salesService;
	@Inject
	private PinService pinService;

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
		int totalCnt = userService.selectListCnt(map); // DB�뿰�룞_ 珥� 媛��닔
														// 援ы빐�삤湲�
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

	@RequestMapping(value = "grade.do", method = RequestMethod.GET)
	public String gradeList(Model model) throws Exception {
		List<Grade> gradeList = gradeService.selectList();
		model.addAttribute(gradeList);
		return "grade/gradeList";
	}

	@RequestMapping(value = "grade.do", method = RequestMethod.POST)
	public String gradeInsert(@ModelAttribute @Valid Grade grade) throws Exception {
		gradeService.insert(grade);
		return "redirect:/admin/grade.do";
	}

	@RequestMapping(value = "gradeUpdate.do", method = RequestMethod.POST)
	public String gradeUpdate(@ModelAttribute @Valid Grade grade) throws Exception {
		gradeService.update(grade);
		logger.info("grade has been successfully updated!! - " + grade.toString());
		return "redirect:/admin/grade.do";
	}

	@RequestMapping(value = "modifyAllUsersGrade.do")
	public String modifyAllUsersGrade() throws Exception {
		userService.modifyAllUsersGradeInitialize();
		Grade grade = new Grade();
		List<Grade> gradeList = gradeService.selectList();
		for (int i = 0; i < gradeList.size(); i++) {
			grade = gradeList.get(i);
			userService.modifyAllUsersGrade(grade);
			logger.info("\n***Grade idx" + grade.getIdx() + ", " + grade.getGrade()
					+ " users \nwho bought whole purchase price between " + grade.getMin() + " and " + grade.getMax()
					+ " last " + grade.getBuy_term() + " months \nhave been successfully updated!");
		}
		return "redirect:/admin/grade.do";
	}

	@RequestMapping("deleteGrade.do")
	public String gradeDelete(@RequestParam int idx) throws Exception {
		gradeService.delete(idx);
		return "redirect:/admin/grade.do";
	}
	
	@RequestMapping(value = "salesList.do", method = RequestMethod.GET)
	public ModelAndView salesList(@RequestParam(value = "startDate", required = false) String startDate,
			@RequestParam(value = "endDate", required = false) String endDate, Integer pageCount) throws Exception {
		ModelAndView mav = new ModelAndView("sales/salesList");
		
		PageMaker pagemaker = new PageMaker();
		
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		Date date = new Date();
		String nowDate = sdf.format(date);
		
		Timestamp firstTimestamp = new Timestamp(0);
		String firstDate = sdf.format(firstTimestamp);		// 19700101
		
		if ( startDate == null || endDate == null )
			return mav;
		else if ( Integer.parseInt(startDate) > Integer.parseInt(endDate) 
				 || Integer.parseInt(startDate) < Integer.parseInt(firstDate)
				 || Integer.parseInt(endDate) > Integer.parseInt(nowDate) ) {
			mav.setViewName("sales/salesListFail");
			return mav;
		}
		
		Date formattedStartDate = sdf.parse(startDate);
		Date formattedEndDate = sdf.parse(endDate);
		formattedEndDate = getEndOfDay(formattedEndDate);		// yyyymmdd 형식으로 입력된 날짜의 마지막 시간을 구함
		   
		Timestamp startTimestamp = new Timestamp(formattedStartDate.getTime());
		Timestamp endTimestamp = new Timestamp(formattedEndDate.getTime());
		
		HashMap<String, Object> dateMap = new HashMap<String, Object>();
		dateMap.put("start", startTimestamp);
		dateMap.put("end", endTimestamp);
		
		HashMap<String, Object> totalMapForDaterange = salesService.selectSalesForDaterange(dateMap);
		
		int totalCnt = Integer.parseInt(String.valueOf(totalMapForDaterange.get("totalcnt")));		
		long totalSalesPrice = Long.parseLong(String.valueOf(totalMapForDaterange.get("totalsalesprice")));		
		int totalUsedPoint = Integer.parseInt(String.valueOf(totalMapForDaterange.get("totalusedpoint")));		
		
		int page = ( pageCount != null ) ? pageCount.intValue() : 1;
		pagemaker.setPage(page);
		int countPerPaging = 10;
		int pageCnt = 10;
		
		pagemaker.setCount(totalCnt, pageCnt, countPerPaging);
		
		int first = ( (page - 1) * pageCnt);
		dateMap.put("firstrow", first);
		dateMap.put("pagecnt", pageCnt);
		
		List<HashMap<String, Object>> salesList = salesService.selectSalesForDaterangeAndPagination(dateMap);
		
		for ( HashMap<String, Object> sales : salesList )
		{
			Iterator<String> iterator = sales.keySet().iterator();
		    while (iterator.hasNext()) {
		        String key = (String) iterator.next();
		        logger.info("key = " + key);
		        logger.info(" value = " + sales.get(key));
		    }
		}
		
		logger.info("START DATE = " + startTimestamp);
		logger.info("END DATE = " + endTimestamp);
		logger.info("TOTAL COUNT = " + totalCnt);
		logger.info("PAGE = " + page);
		
		mav.addObject("salesList", salesList);
		mav.addObject("totalSalesPrice", totalSalesPrice);
		mav.addObject("totalUsedPoint", totalUsedPoint);
		mav.addObject("pageMaker", pagemaker);
		
		return mav;
	}
	
	private Date getEndOfDay(Date day) {
		return getEndOfDay(day, Calendar.getInstance());
	}
	  
	private Date getEndOfDay(Date day, Calendar cal) {
		if (day == null) 
			day = new Date();
		
		cal.setTime(day);
		cal.set(Calendar.HOUR_OF_DAY, cal.getMaximum(Calendar.HOUR_OF_DAY));
		cal.set(Calendar.MINUTE,      cal.getMaximum(Calendar.MINUTE));
		cal.set(Calendar.SECOND,      cal.getMaximum(Calendar.SECOND));
		cal.set(Calendar.MILLISECOND, cal.getMaximum(Calendar.MILLISECOND));
		return cal.getTime();
	}
	
	@RequestMapping(value = "salesDetail.do", method = RequestMethod.GET)
	public ModelAndView salesDetail(Timestamp purchasedate, String username) throws Exception {
		ModelAndView mav = new ModelAndView("sales/salesDetail");
		
		HashMap<String, Object> userMap = new HashMap<String, Object>();
		userMap.put("purchasedate", purchasedate);
		userMap.put("username", username);
		
		HashMap<String, Object> userDetailMap = salesService.selectSalesForDate(userMap);
		// userDetailMap이 null일 때, 400 Error 예외페이지 처리
		
		int purchaseid = (int) userDetailMap.get("purchaseid");
		
		List<HashMap<String, Object>> salesDetailList = salesService.selectSalesDetail(purchaseid);
		
		mav.addObject("userMap", userMap);
		mav.addObject("userDetailMap", userDetailMap);
		mav.addObject("salesDetailList", salesDetailList);
		
		return mav;
		
	}

	// =============================== pin =============================== //

	@RequestMapping("pinBoardList.do")
	public ModelAndView pinBoardList(PageMaker pagemaker,
			@RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		// map.put("searchKeyword", searchKeyword);
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = pinService.selectListCnt(map);
		int countPerPage = 10;
		int countPerPaging = 10;

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		List<PinBoard> list = pinService.pinBoardList(map);
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		mav.addObject("pinBoardList", list);
		mav.addObject("pageMaker", pagemaker);
		mav.setViewName("pin/pinBoardList");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		logger.info(list.toString());
		return mav;
	}

	@RequestMapping("deletePinBoard.do")
	public String deletePinBoard(@RequestParam int pinboardno) throws Exception {
		pinService.deleteAllPin(pinboardno);
		pinService.deletePinBoard(pinboardno);
		return "redirect:/admin/pinBoardList.do";
	}
}
