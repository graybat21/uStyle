//package com.ustyle.controller;
//
//import javax.inject.Inject;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.ustyle.service.PinService;
//import com.ustyle.service.ProductService;
//
//@Controller
//public class PinController {
//
//	private static final Logger logger = LoggerFactory.getLogger(PinController.class);
//	
//	@Inject
//	private PinService pinService;
//	@Inject
//	private ProductService productService;
//	
//	@RequestMapping("pin.do")
//	public ModelAndView myPinList() throws Exception{
//		ModelAndView mav=new ModelAndView("pin/ ? /My Pin Board");
//		
//		return mav;
//	}
//	
//}
