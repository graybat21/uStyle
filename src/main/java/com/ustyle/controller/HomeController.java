package com.ustyle.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.User;
import com.ustyle.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private UserService service;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login(Locale locale) {
		logger.info("login {}.", locale);
		return "login";
	}

	// @RequestMapping(value="login.do", method=RequestMethod.POST)
	// public ModelAndView loginSuccess(){
	// ModelAndView mav=new ModelAndView();
	// mav.addObject();
	// mav.setViewName("");
	// return mav;
	// }

	@RequestMapping(value = "register.do", method = RequestMethod.GET)
	public String registerForm() {
		return "register";
	}

	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public ModelAndView register(User user, BindingResult bindingResult, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("login");
		// System.out.println(user);
		service.insert(user);
		session.setAttribute("USER", user);
		mav.addObject(user);
		return mav;

	}

}
