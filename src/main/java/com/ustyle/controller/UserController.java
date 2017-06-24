package com.ustyle.controller;

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

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "user/login/LOGIN";
	}
	
	

	@RequestMapping(value = "/loginPost.do", method = RequestMethod.POST)
	public String login(HttpServletRequest request, User user) throws Exception {

//		try {
			User resultUser = service.userLogin(user);
			logger.info("{}", resultUser);

			String rawPassword = user.getPassword();
			String encodedPassword = resultUser.getPassword();
			logger.info(resultUser.getAuth().toString());

		if (resultUser == null || !(passwordEncoder.matches(rawPassword, encodedPassword))) {
            return "user/loginError/No Match PW";
		} 
		else if (!resultUser.getAuth().equals("y")) {
            return "user/loginError/Login Error";
        }

         HttpSession session = request.getSession();

         session.setAttribute("session_user", resultUser);
         
         User loginUser = (User) session.getAttribute("session_user");
         logger.info(loginUser.toString());
         
         String dest = (String)session.getAttribute("dest");

         if ( dest == null || dest.equals("") ) {
            return "redirect:/";
         }
         else {
            return "redirect:"+dest;
         }
			  
			 
			
			/*
			if (resultUser == null || !(passwordEncoder.matches(rawPassword, encodedPassword))) {
				return "user/loginError/No Match PW";
			} else if (!resultUser.getAuth().equals("y")) {
				return "user/loginError/Login Error";
			}

			HttpSession session = request.getSession();
			
			session.setAttribute("session_user", resultUser);
			// session.setAttribute("session_realname", resultUser.getRealname());
			
//			session.setAttribute("session_username", resultUser.getUsername());
//			session.setAttribute("session_point", resultUser.getPoint());
			// session.setAttribute("TOKEN_SAVE_CHECK", "TRUE");
			
			User loginUser = (User) session.getAttribute("session_user");
			logger.info(loginUser.toString());
			
			return "user/loginSuccess/LOGIN SUCCESS";
			//return "redirect:/qna.do";
			*/
//		} 
//		catch (NullPointerException e) {
//			return "user/loginError/LOGIN ERROR";
//		}
	}

	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		mav.addObject("user", new User());
		mav.setViewName("redirect:/login.do");

		return mav;
	}

	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String registerForm() {
		return "user/register/Register";
	}
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String Index() {
		return "user/index/uStyleHome";
	}

	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute @Valid User user, BindingResult bindingResult, HttpSession session)
			throws Exception {

		logger.info(user.toString());
		userEntryValidator.validate(user, bindingResult);

		String encryptPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encryptPassword);

		ModelAndView mav = new ModelAndView("user/joinSuccess/JoinSuccess");

		if (bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			mav.setViewName("user/register/Register");
			return mav;
		}

		String joinCode = getUuid();
		user.setAuth(joinCode);
		sendMail(user.getUsername(), user.getEmail(), joinCode);

		service.insert(user);
		mav.addObject(user);

		return mav;
	}
	
		
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String updateForm() {
		return "user/update/Update";
		
	}
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public ModelAndView update(@ModelAttribute @Valid User updateUser, BindingResult bindingResult, HttpSession session)
			throws Exception {

		logger.info(updateUser.toString());
		userEntryValidator.validate(updateUser, bindingResult);

		String encryptPassword = passwordEncoder.encode(updateUser.getPassword());
		updateUser.setPassword(encryptPassword);

		ModelAndView mav = new ModelAndView("user/updateSuccess/UpdateSuccess");

		if (bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			mav.setViewName("user/update/Update");
			return mav;
		}

		service.update(updateUser);
		
		if (session != null) {	// 회원정보를 변경한 후, 다시 로그인하도록 유도한다.
			session.invalidate();
		}
		mav.addObject(updateUser);

		return mav;
	}

	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String deleteForm() {
		return "user/deleteForm/Delete";
	}
	
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String delete(User user, HttpSession session)
			throws Exception {
		//////////user.setUsername((String) session.getAttribute("session_username"));
		logger.info(user.toString());
		User resultUser = service.userLogin(user);
		logger.info(resultUser.toString());
		String encodedPassword = resultUser.getPassword();
		String encryptPassword = user.getPassword();

		if ( !(passwordEncoder.matches(encryptPassword, encodedPassword)) ) {
			return "user/deleteError/No Match PW";
		}
		service.delete(user.getUsername());

		return "redirect:/logout.do";
	}
	
	private void sendMail(String username, String email, String joinCode) throws Exception {

		MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();

		mimeMessage.setFrom(new InternetAddress("ustyle1111@gmail.com"));
		mimeMessage.addRecipient(RecipientType.TO, new InternetAddress(email));

		String subject = "uStyle - 회원가입 인증요청메일 입니다.";
		mimeMessage.setSubject(subject);

		StringBuilder sb = new StringBuilder();
		// String uri = "http://localhost:8080/uStyle/";
		String uri = "http://localhost:8080/";
		sb.append("<a href='" + uri + "'>");
		sb.append("<img src='https://mark.trademarkia.com/logo-images/symeli-inc/ustyle-85007854.jpg'></a>");
		sb.append("<h1>Welcome uStyle</h1>");
		sb.append("저희 uStyle에 가입해 주셔서 감사드립니다.<br>");
		sb.append("인증을 거친후 저희 사이트를 정상적으로 이용하실 수 있습니다.<br>");
		sb.append("<hr><br>");
		sb.append("<a href='" + uri + "auth/" + username + "/" + joinCode + "'>");
		sb.append("링크를 클릭하시면 인증됩니다.</a>");
		mimeMessage.setText(sb.toString(), "UTF-8", "html");

		javaMailSenderImpl.send(mimeMessage);
	}

	@RequestMapping(value = "/auth/{username}/{auth}")
	public ModelAndView authOk(@PathVariable String username, @PathVariable String auth) throws Exception {

		ModelAndView mav = new ModelAndView();
		User user = new User();
		user.setAuth(auth);
		user.setUsername(username);

		boolean isUserAuthOk = service.userAuthOk(user);

		if (isUserAuthOk) {
			service.userAuthInitialize(username);
			mav.setViewName("redirect:/authSuccess.do");
		} else {
			mav.setViewName("redirect:/authError.do");
		}

		return mav;
	}

	@RequestMapping("/authSuccess.do")
	public String authSuccess() {
		return "user/authSuccess/인증 성공";
	}

	@RequestMapping("/authError.do")
	public String authError() {
		return "user/authError/인증 실패";
	}

	@RequestMapping(value = "/duplicationCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int userExist(@RequestBody String username) throws Exception {

		logger.info(username);
		int isUserExist = service.userExist(username);
		return isUserExist;
	}

	private String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
}
