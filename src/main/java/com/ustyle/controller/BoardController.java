package com.ustyle.controller;

import java.util.Enumeration;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.User;
import com.ustyle.service.UserService;
import com.ustyle.utils.UserEntryValidator;

@Controller
public class BoardController {


	/**
	 * Simply selects the home view to render by returning its name.
	 */

	
	@RequestMapping(value = "notice.do", method = RequestMethod.GET)
	public String Board_notice() {
		return "board/board_notice/Notice";
	}
	
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
