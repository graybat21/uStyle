package com.ustyle.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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
	public ModelAndView myPinList() throws Exception {
		ModelAndView mav = new ModelAndView("pin/myPin/My Pin Board");
		List<PinBoard> pinBoardList = pinService.getPinBoardList("sunho1");
		mav.addObject("pinBoardList", pinBoardList);
		return mav;
	}

	// @RequestMapping("pinCreate.do")
	// public String pinTest(){
	// return "pin/pinCreate/test";
	// }

	@RequestMapping(value = "createPinBoard.do", method = RequestMethod.POST)
	public String createPinBoard(HttpSession session, @RequestParam String pinboardname) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("session_user");
		map.put("username", user.getUsername());
		map.put("pinboardname", pinboardname);
		pinService.createPinBoard(map);
		return "pin/pinCreateSuccess/test";
		// return "redirect:/";
	}

	@RequestMapping(value = "modifyPinBoardName.do", method = RequestMethod.POST)
	public String modifyPinBoardName(@RequestParam String pinboardname) throws Exception {
		pinService.modifyPinBoardName(pinboardname);
		return "redirect:/pin.do";
	}
	@RequestMapping(value = "deletePinBoard.do", method = RequestMethod.POST)
	public String deletePinBoard(@RequestParam int pinboardno) throws Exception {
		pinService.deletePinBoard(pinboardno);
		return "redirect:/pin.do";
	}

	@RequestMapping(value="viewPin.do", method=RequestMethod.POST)
	public String viewPin(@RequestParam int pinboardno)throws Exception{
		List<Pin> pinsList = pinService.getPins(pinboardno);
		return "";
	}
	
	@RequestMapping(value="insertPin.do", method=RequestMethod.POST)
	public String insertPin(Pin pin) throws Exception{
		pinService.insertPin(pin);
		return "";
	}
	
	@RequestMapping(value="deletePin.do", method=RequestMethod.POST)
	public String deletePin(@RequestParam int pinno)throws Exception{
		pinService.deletePin(pinno);
		return "";
	}
}
