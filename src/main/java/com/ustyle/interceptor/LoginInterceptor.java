package com.ustyle.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ustyle.domain.User;

public class LoginInterceptor extends HandlerInterceptorAdapter
{
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object Handler, ModelAndView modelAndView) throws Exception {
//		HttpSession session = request.getSession();
//		Object dest = session.getAttribute("dest");
//		response.sendRedirect(dest != null ? (String)dest : "/");
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
		Object handler) throws Exception
	{
		HttpSession session = request.getSession();
		
		if ( session.getAttribute("session_user") != null )
		{
			logger.info("clear login data before");
			session.removeAttribute("session_user");
		}
		
		return true;
	}
	
	
}
