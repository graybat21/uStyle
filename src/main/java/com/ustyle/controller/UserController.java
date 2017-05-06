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
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private JavaMailSenderImpl javaMailSenderImpl;

	@Inject
	private UserService service;
	
	@Inject
	private UserEntryValidator userEntryValidator;
	
	@Inject
	BCryptPasswordEncoder passwordEncoder;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String loginForm(){
		return "login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(HttpServletRequest request, User user) throws Exception {
		
		try {
			User resultUser = service.userLogin(user);
			// username 과 password 를 이용해 정보불러옴.
			// email 과 password 를 이용해서 정보불러옴?
			logger.info("로그인을 통해 얻은 user 정보 {}", resultUser);
			
			String rawPassword = user.getPassword();
			String encodedPassword = resultUser.getPassword();
			
			if ( resultUser == null || !(passwordEncoder.matches(rawPassword, encodedPassword)) ) {
				return "loginError"; // user 에 username, password 입력이 안됨.
			}
			
			HttpSession session = request.getSession();
			
			// 세션에 저장
			session.setAttribute("USER", resultUser);
	//		session.setAttribute("session_realname", resultUser.getRealname());
			session.setAttribute("session_username", resultUser.getUsername());
			session.setAttribute("session_point", resultUser.getPoint());
	//		session.setAttribute("TOKEN_SAVE_CHECK", "TRUE"); // 암호화 관련
			
			return "loginSuccess";
		} 
		catch (NullPointerException e)
		{
			return "loginError"; // user 에 username, password 입력이 안됨.
		}
	}

	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession(false);
		// true 가 default, session 미존재시 새로 session 생성
		// false 일 경우, session 미존재시 그냥 null 값 반환
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
		
		/* ------------- 비밀번호 암호화하는 작업 시작 ------------- */
		String encryptPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encryptPassword);
		/* ------------- 비밀번호 암호화하는 작업 끝 ------------- */
		
		ModelAndView mav = new ModelAndView("joinSuccess");
		
		if ( bindingResult.hasErrors() )
		{
			mav.getModel().putAll(bindingResult.getModel());
			mav.setViewName("register");
			return mav;
		}

		int ran = new Random().nextInt(90000) + 10000; // 10000 ~ 99999 : 5자리
		user.setPoint(ran); // 포인트 칼럼 임시로 인증에 이용, 인증후 초기화
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

		// from, to 입력
		mimeMessage.setFrom(new InternetAddress("ustyle1111@gmail.com"));
		mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(email));

		// 제목 입력
		String subject = "uStyle - 회원가입 인증 코드 발급 안내 입니다.";
		mimeMessage.setSubject(subject);

		// 내용 입력
		StringBuilder sb = new StringBuilder();
//		String uri = "http://localhost:8080/uStyle/";
		String uri = "http://localhost:8080/";
		sb.append("<a href='" + uri + "'>");
		sb.append("<img src='https://mark.trademarkia.com/logo-images/symeli-inc/ustyle-85007854.jpg'></a>");
		sb.append("<h1>Welcome uStyle</h1>");
		sb.append("저희 uStyle를 가입해 주셔서 감사드립니다.<br>");
		sb.append("아래 링크를 클릭하시면 사이트를 정상적으로 이용가능하십니다.<br>");
		sb.append("<hr><br>");
		sb.append("<a href='" + uri + "auth/" + username + "/" + joinCode + "'>");
		sb.append("귀하의 인증 코드는 " + joinCode + " 입니다. 링크를 클릭하시면 인증됩니다.</a>");
		logger.info("content : {}",sb);
		mimeMessage.setText(sb.toString(), "UTF-8", "html");

		javaMailSenderImpl.send(mimeMessage);
	}

	// 이메일을 통한 인증
	@RequestMapping(value = "/auth/{username}/{point}")
	public ModelAndView authOk(@PathVariable String username, @PathVariable String point) throws Exception {

		ModelAndView mav = new ModelAndView();
		User user = new User();
		user.setPoint(Integer.parseInt(point));
		user.setUsername(username);

		boolean isUserAuthOk = service.userAuthOk(user);

		if (isUserAuthOk) {
			service.userPointInitialize(username); // 인증완료후 포인트 초기화
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
	
	@RequestMapping(value="duplicationCheck.do",method=RequestMethod.POST)
	@ResponseBody
	public int userExist(@RequestBody String username) throws Exception {
		
		logger.info(username);
		int isUserExist = service.userExist(username);
		return isUserExist;
	}

}
