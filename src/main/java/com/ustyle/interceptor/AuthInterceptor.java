package com.ustyle.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ustyle.service.UserService;

public class AuthInterceptor extends HandlerInterceptorAdapter
{
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private UserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception
	{
		HttpSession session = request.getSession();

		if ( session.getAttribute("session_user") == null )
		{
			logger.info("current user is not logined");
			
			String oldUrl = request.getHeader("referer");
			
			session.setAttribute("dest", oldUrl);
			
//			saveDest(request);
			
//			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

//			if ( loginCookie != null )
//			{
//				User user = service.checkLoginBefore(loginCookie.getValue());
//				
//				logger.info("USERVO: " + userVO);
				
//				if ( userVO != null )
//				{
//					session.setAttribute("login", userVO);
//					return true;
//				}
//			}
			
			response.sendRedirect("/login.do");
			return false;
		}
		return true;
	}
	
//	private void saveDest(HttpServletRequest req)
//	{
//		String uri = req.getRequestURI();
//		
//		String query = req.getQueryString();
//		
//		if ( query == null || query.equals("null") )
//			query = "";
//		else
//			query = "?" + query;
//		
//		System.out.println(uri + query);
//		
//		if ( req.getMethod().equals("GET") )
//		{
//			logger.info("dest: " + (uri + query));
//			req.getSession().setAttribute("dest", uri + query);
//		}
//	}
}
