package com.ustyle.controller;

import javax.inject.Inject;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Item;
import com.ustyle.service.ItemService;

@Controller
@RequestMapping("/admin/item/*")
public class ItemController {

	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Inject
	private ItemService service;

	@RequestMapping(value = "addItem.do", method = RequestMethod.GET)
	public String addItemForm(@RequestParam(value = "productid", required = false) String productid, Model model)
			throws Exception {
//		if (productid == null) {		// NPE 처리
//			productid = String.valueOf(service.getNewProductId());
//		}
		model.addAttribute("productid", productid);
		return "item/addItem";
	}
	
	@RequestMapping(value = "addItem.do", method = RequestMethod.POST)
	public ModelAndView addItem(@ModelAttribute @Valid Item item)
			throws Exception {
		
		logger.info(item.toString());

		ModelAndView mav = new ModelAndView("main/base");

		service.insert(item);
		mav.addObject(item);
		return mav;
	}
}
