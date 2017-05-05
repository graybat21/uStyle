package com.ustyle.controller;

import java.util.Random;

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
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.User;
import com.ustyle.service.UserService;
import com.ustyle.utils.UserEntryValidator;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private JavaMailSenderImpl javaMailSenderImpl;

	@Inject
	private UserService service;
	@Inject
	private UserEntryValidator userEntryValidator;

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value="login.do",method=RequestMethod.GET)
	public String loginForm(){
		return "login";
	}
	@RequestMapping(value="login.do",method=RequestMethod.POST)
	public String login(HttpServletRequest request, User user) throws Exception {

		User resultUser = service.userLogin(user);
		// username �� password �� �̿��� �����ҷ���.
		// email �� password �� �̿��ؼ� �����ҷ���?
		logger.info("�α����� ���� ���� user ���� {}",resultUser);
		
		if (resultUser == null) {
			return "loginError"; // user �� username, password �Է��� �ȵ�.
		}
		HttpSession session = request.getSession();
		
		// ���ǿ� ����
		session.setAttribute("USER", resultUser);
//		session.setAttribute("session_realname", resultUser.getRealname());
		session.setAttribute("session_username", resultUser.getUsername());
		session.setAttribute("session_point", resultUser.getPoint());
//		session.setAttribute("TOKEN_SAVE_CHECK", "TRUE"); // ��ȣȭ ����
		
		return "loginSuccess";
	}

	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession(false);
		// true �� default, session ������� ���� session ����
		// false �� ���, session ������� �׳� null �� ��ȯ
		if (session != null) {
			session.invalidate();
		}
		mav.addObject("user", new User());
		mav.setViewName("redirect:/login.do");

		return mav;
	}

	@RequestMapping(value = "register.do", method = RequestMethod.GET)
	public String registerForm() {
		return "register";
	}

	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute @Valid User user, BindingResult bindingResult, HttpSession session) throws Exception {
		
		logger.info(user.toString());
		userEntryValidator.validate(user, bindingResult);
		ModelAndView mav = new ModelAndView("joinSuccess");
		
		if ( bindingResult.hasErrors() )
		{
			mav.getModel().putAll(bindingResult.getModel());
			mav.setViewName("register");
			return mav;
		}

		int ran = new Random().nextInt(90000) + 10000; // 10000 ~ 99999 : 5�ڸ�
		user.setPoint(ran); // ����Ʈ Į�� �ӽ÷� ������ �̿�, ������ �ʱ�ȭ
		String joinCode = String.valueOf(ran);
		// String username=user.getUsername();
		sendMail(user.getUsername(), user.getEmail(), joinCode);

		service.insert(user);
		session.setAttribute("USER", user);
		mav.addObject(user);

		return mav;
	}

	private void sendMail(String username, String email, String joinCode) throws Exception {

		MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();

		// from, to �Է�
		mimeMessage.setFrom(new InternetAddress("ustyle1111@gmail.com"));
		mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(email));

		// ���� �Է�
		String subject = "uStyle - ȸ������ ���� �ڵ� �߱� �ȳ� �Դϴ�.";
		mimeMessage.setSubject(subject);

		// ���� �Է�
		StringBuilder sb = new StringBuilder();
		String uri = "http://localhost:8080/uStyle/";
		sb.append("<a href='" + uri + "'>");
		sb.append("<img src='https://mark.trademarkia.com/logo-images/symeli-inc/ustyle-85007854.jpg'></a>");
		sb.append("<h1>Welcome uStyle</h1>");
		sb.append("���� uStyle�� ������ �ּż� ����帳�ϴ�.<br>");
		sb.append("�Ʒ� ��ũ�� Ŭ���Ͻø� ����Ʈ�� ���������� �̿밡���Ͻʴϴ�.<br>");
		sb.append("<hr><br>");
		sb.append("<a href='" + uri + "auth/" + username + "/" + joinCode + "'>");
		sb.append("������ ���� �ڵ�� " + joinCode + " �Դϴ�. ��ũ�� Ŭ���Ͻø� �����˴ϴ�.</a>");
		logger.info("content : {}",sb);
		mimeMessage.setText(sb.toString(), "UTF-8", "html");

		javaMailSenderImpl.send(mimeMessage);
	}

	// �̸����� ���� ����
	@RequestMapping(value = "/auth/{username}/{point}")
	public ModelAndView authOk(@PathVariable String username, @PathVariable String point) throws Exception {

		ModelAndView mav = new ModelAndView();
		User user = new User();
		user.setPoint(Integer.parseInt(point));
		user.setUsername(username);

		boolean isUserAuthOk = service.userAuthOk(user);

		if (isUserAuthOk) {
			service.userPointInitialize(username); // �����Ϸ��� ����Ʈ �ʱ�ȭ
			mav.setViewName("redirect:/authSuccess.do");
		} else {
			mav.setViewName("redirect:/authError.do");
		}

		return mav;
	}

	@RequestMapping("/authSuccess.do")
	public String authSuccess() {
		return "authSuccess";
	}

	@RequestMapping("/authError.do")
	public String authError() {
		return "authError";
	}

}
