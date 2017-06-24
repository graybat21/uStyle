package com.ustyle.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import com.ustyle.service.ProductService;

@Controller
public class PinController {

	private static final Logger logger = LoggerFactory.getLogger(PinController.class);
	
	@Inject
	private PinService pinService;
	@Inject
	private ProductService productService;
	
	
}
