package com.ustyle.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "admin/login";
	}

//	@RequestMapping(value = "login.do", method = RequestMethod.POST)
//	public String login(HttpServletRequest request, User user) throws Exception {
//
//		try {
//			
//			
//		} catch (NullPointerException e) {
//			return "user/loginError/LOGIN ERROR";
//		}
//	}
}
