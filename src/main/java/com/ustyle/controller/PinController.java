package com.ustyle.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Pin;
import com.ustyle.domain.PinBoard;
import com.ustyle.domain.User;
import com.ustyle.service.PinService;
import com.ustyle.service.ProductService;

@Controller
public class PinController {

	private static final Logger logger = LoggerFactory.getLogger(PinController.class);

	@Inject
	private PinService pinService;
	@Inject
	private ProductService productService;

	@RequestMapping("pin.do")
	public ModelAndView myPinList(HttpSession session){
		ModelAndView mav = new ModelAndView("pin/myPinBoard/My Pin Board");
		User user = (User) session.getAttribute("session_user");
		List<PinBoard> pinBoardList = pinService.getPinBoardMyList(user.getUsername());
		logger.info(pinBoardList.toString());
		List<PinBoard> pinBoardMainImageList = pinService.getPinBoardMainImage(user.getUsername());
		logger.info(pinBoardMainImageList.toString());
//		pinService.getProductImage(pinboardno);
		mav.addObject("pinBoardList", pinBoardList);
		mav.addObject("imageList",pinBoardMainImageList);
		return mav;
	}

	@RequestMapping(value = "createPinBoard.do", method = RequestMethod.GET)
	public String createPinBoard() throws Exception {
		return "pin/createPinBoardForm/New Create Form";
	}
	@RequestMapping(value = "createPinBoard.do", method = RequestMethod.POST)
	public String createPinBoard(HttpSession session, PinBoard pinBoard) throws Exception {
//		PinBoard pinBoard=new PinBoard();
		User user = (User) session.getAttribute("session_user");
		pinBoard.setUsername(user.getUsername());
//		pinBoard.setPinboardname(pinboardname);
		logger.info(pinBoard.toString());
		pinService.createPinBoard(pinBoard);
		return "redirect:/pin.do";
	}

	@RequestMapping(value = "modifyPinBoardName.do", method = RequestMethod.POST)
	public String modifyPinBoardName(@RequestParam PinBoard pinBoard) throws Exception {
		pinService.modifyPinBoardName(pinBoard);
		return "redirect:/pin.do";
	}
	
	@RequestMapping(value = "modifyPinBoardContent.do", method = RequestMethod.POST)
	public String modifyPinBoardContent(@RequestParam PinBoard pinBoard) throws Exception {
		pinService.modifyPinBoardContent(pinBoard);
		return "redirect:/pin.do";
	}
	
	@RequestMapping(value = "deletePinBoard.do", method = RequestMethod.POST)
	public String deletePinBoard(@RequestParam int pinboardno) throws Exception {
		pinService.deleteAllPin(pinboardno);
		pinService.deletePinBoard(pinboardno);
		return "redirect:/pin.do";
	}
	
//	=======================================================================
	
	@RequestMapping(value="viewPin.do", method=RequestMethod.GET)
	public ModelAndView viewPin(@RequestParam int pinboardno)throws Exception{
		ModelAndView mav=new ModelAndView("pin/pinList/Pin List");
		List<Pin> pinList = pinService.getPins(pinboardno);
		
		mav.addObject(pinList);
		mav.addObject("pinboardno",pinboardno);
		return mav;
	}
	
	@RequestMapping(value="insertPin.do", method=RequestMethod.GET)
	public ModelAndView insertPinView(@RequestParam int pinboardno) throws Exception{
		ModelAndView mav=new ModelAndView("pin/insertPinForm/insert pin");
		mav.addObject("pinboardno",pinboardno);
		return mav;
	}
	@RequestMapping(value="insertPin.do", method=RequestMethod.POST)
	public String insertPin(Pin pin) throws Exception{
//		pin.setProductid(productid);
		pinService.insertPin(pin);
		
		return "redirect:/pin.do";
	}
	
//	@RequestMapping(value="deletePin.do", method=RequestMethod.POST)
//	public String deletePin(@RequestParam int pinno)throws Exception{
//		pinService.deletePin(pinno);
//		return "redirect:/pin.do";
//	}
}
