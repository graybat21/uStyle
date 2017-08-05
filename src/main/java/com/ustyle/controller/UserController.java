package com.ustyle.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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
import com.ustyle.utils.PageMaker;
import com.ustyle.utils.UserEntryValidator;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private JavaMailSenderImpl javaMailSenderImpl;

	@Inject
	private UserService userService;

	@Inject
	private UserEntryValidator userEntryValidator;

	@Inject
	BCryptPasswordEncoder passwordEncoder;
	
	/**
	 * 홈페이지 호출
	 * 
	 * @return 홈 페이지
	 */
	
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String Index() {
		return "user/index/uStyleHome";
	}

	/**
	 * 로그인 페이지를 호출함
	 * 
	 * @param request
	 * @return 각각의 페이지(로그인이 이미 되어있는 경우, 메인 페이지로 리다이렉션됨)
	 */

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "user/login/LOGIN";
	}
	
	/**
	 * 로그인 페이지에서 로그인 버튼을 눌러서 회원의 로그인을 진햄함
	 * 
	 * @param request, user
	 * @return 로그인 이전 페이지, 만약 없거나 로그인 페이지일 경우 메인 페이지
	 */
	
	@RequestMapping(value = "/loginPost.do", method = RequestMethod.POST)
	public String login(HttpServletRequest request, User user) throws Exception {

		User resultUser = userService.userLogin(user);
		logger.info("{}", resultUser);
		
		if ( resultUser == null || !resultUser.getAuth().equals("y")) {
            return "user/loginError/Login Error";
        }

		String rawPassword = user.getPassword();
		String encodedPassword = resultUser.getPassword();
		logger.info(resultUser.getAuth().toString());

		if ( !(passwordEncoder.matches(rawPassword, encodedPassword)) ) {
            return "user/loginError/No Match PW";
		} 

         HttpSession session = request.getSession();

         session.setAttribute("session_user", resultUser);
         session.setAttribute("session_userpoint", resultUser.getPoint());
         
         User loginUser = (User) session.getAttribute("session_user");
         logger.info(loginUser.toString());
         
         String dest = (String)session.getAttribute("dest");	
         logger.info("dest: " + dest);

         if ( dest == null || dest.equals("") || dest.endsWith("/login.do") ) {
            return "redirect:/";
         }
         else {
            return "redirect:" + dest;
         }
	}
	
	/**
	 * 회원의 로그아웃 수행
	 * 
	 * @param request
	 * @return 로그인 페이지
	 */

	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		
		mav.addObject("user", new User());
		mav.setViewName("redirect:/");

		return mav;
	}
	
	/**
	 * 회원가입 페이지를 호출함
	 * 
	 * @return 회원가입 페이지
	 */

	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String registerForm() {
		return "user/register/Register";
	}
	
	/**
	 * 회원가입 진행 
	 * 
	 * @param user
	 * @param bindingResult
	 * @param session
	 * @return mav
	 * @throws Exception
	 */

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

		userService.insert(user);
		mav.addObject(user);

		return mav;
	}
	
	/**
	 * 회원정보 수정 페이지를 불러옴
	 * 
	 * @param session
	 * @return 회원정보 수정 페이지
	 */
		
	@RequestMapping(value = "/update.do", method = RequestMethod.GET)
	public String updateForm(HttpSession session) {
		return "user/update/Update";
		
	}
	
	/**
	 * 회원정보 수정 작업 진행
	 * 
	 * @param updateUser
	 * @param bindingResult
	 * @param session
	 * @return mav
	 * @throws Exception
	 */
	
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

		userService.update(updateUser);
		
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
		logger.info(user.toString());
		User resultUser = userService.userLogin(user);
		logger.info(resultUser.toString());
		String encodedPassword = resultUser.getPassword();
		String encryptPassword = user.getPassword();

		if ( !(passwordEncoder.matches(encryptPassword, encodedPassword)) ) {
			return "user/deleteError/No Match PW";
		}
		userService.delete(user.getUsername());

		return "redirect:/logout.do";
	}
	
	/**
	 * 가입인증 메일을 보내는 작업
	 * 
	 * @param username
	 * @param email
	 * @param joinCode
	 * @throws Exception
	 */
	
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
	
	/**
	 * 가입인증 메일에 있는 링크를 통한 인증 작업 진행
	 * 
	 * @param username
	 * @param auth
	 * @return mav
	 * @throws Exception
	 */

	@RequestMapping(value = "/auth/{username}/{auth}")
	public ModelAndView authOk(@PathVariable String username, @PathVariable String auth) throws Exception {

		ModelAndView mav = new ModelAndView();
		User user = new User();
		user.setAuth(auth);
		user.setUsername(username);

		boolean isUserAuthOk = userService.userAuthOk(user);

		if (isUserAuthOk) {
			userService.userAuthInitialize(username);
			mav.setViewName("redirect:/authSuccess.do");
		} else {
			mav.setViewName("redirect:/authError.do");
		}

		return mav;
	}
	
	/**
	 * 인증에 성공했을 때 호출됨.
	 * 
	 * @return 인증 성공 페이지
	 */

	@RequestMapping("/authSuccess.do")
	public String authSuccess() {
		return "user/authSuccess/인증 성공";
	}
	
	/**
	 * 인증에 실패했을 때 호출됨.
	 * 
	 * @return 인증 실패 페이지
	 */

	@RequestMapping("/authError.do")
	public String authError() {
		return "user/authError/인증 실패";
	}
	
	/**
	 * 이미 가입된 회원이 있는지 확인하기 위해 호출되는 메소드
	 * 
	 * @param username
	 * @return
	 * @throws Exception
	 */

	@RequestMapping(value = "/duplicationCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int userExist(@RequestBody User user) throws Exception {
		logger.info(user.getUsername());
		System.out.println("FDFDFDFDFDF");
		int isUserExist = userService.userExist(user.getUsername());
		
		System.out.println(isUserExist);
		return isUserExist;
	}
	
	/**
	 * 회원의 구매내역을 불러옴
	 * 
	 * @param session
	 * @param pageCount
	 * @return mav
	 * @throws Exception
	 */
	
	@RequestMapping("/purchaseList.do")
	public ModelAndView purchaseList(HttpSession session, Integer pageCount) throws Exception {
		ModelAndView mav = new ModelAndView("user/purchaseList/구매내역");
		User loginUser = (User) session.getAttribute("session_user");
		String loginUsername = loginUser.getUsername();
		
		int purchaseCount = userService.selectUserPurchaseCount(loginUsername);
		
		PageMaker pagemaker = new PageMaker();
		int page = ( pageCount != null ) ? pageCount.intValue() : 1;
		int pageCnt = 10;
		pagemaker.setPage(page);
		pagemaker.setCount(purchaseCount, pageCnt, 10);		// 구매한 상품들을 10개씩 보여줌
		
		int start = ((pagemaker.getPage() - 1) * pageCnt);
		
		logger.info("PURCHASECOUNT = " + purchaseCount);
		logger.info("START = " + start);
		logger.info("PAGECNT = " + pageCnt);

		HashMap<String, Object> searchQueryMap = new HashMap<String, Object>();
		searchQueryMap.put("username", loginUsername);
		searchQueryMap.put("start", start);
		searchQueryMap.put("pagecnt", pageCnt);
		
		List<HashMap<String, Object>> userPurchaseList = userService.selectUserPurchaseList(searchQueryMap);
		
		for ( HashMap<String, Object> map : userPurchaseList )
		{
			Iterator<String> iterator = map.keySet().iterator();
		    while (iterator.hasNext()) {
		        String key = String.valueOf(iterator.next());
		        logger.info("key = " + key);
		        logger.info(" value = " + map.get(key));
		    }
		}
		
		int first = start + 1;
		int last = ( first + pageCnt - 1 > purchaseCount ) ? purchaseCount : first + pageCnt - 1;
		
		mav.addObject("userPurchaseList", userPurchaseList);
		mav.addObject("purchaseCount", purchaseCount);
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("pageMaker", pagemaker);
		
		return mav;
	}
	
	/**
	 * 고유성 보장을 위해 '-'가 빠진 범용 고유 식별자(UUID, 소프트웨어 구축에 쓰이는 식별자 표준)를 가져옴.
	 * 
	 * @return '-'가 빠진 범용 고유 식별자
	 */

	private String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
}
