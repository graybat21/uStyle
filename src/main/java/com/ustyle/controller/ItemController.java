package com.ustyle.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/item/*")
public class ItemController {

	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@RequestMapping(value = "add.do", method = RequestMethod.GET)
	public String addItem() {
		return "item/add";
	}
}
