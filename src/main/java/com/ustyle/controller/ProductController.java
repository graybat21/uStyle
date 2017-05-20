package com.ustyle.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ustyle.domain.Product;
import com.ustyle.service.ProductService;

@Controller
@RequestMapping("/admin/product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService service;

	@RequestMapping(value = "addProduct.do", method = RequestMethod.GET)
	public String addProductForm() {
		return "product/addProduct";
	}
	
	@RequestMapping(value = "addProduct.do", method = RequestMethod.POST)
	public String addProduct(Product product) throws Exception {
		logger.info(product.toString());
		
		service.insert(product);
		
		return "redirect:/admin/main.do";
	}
	
	@RequestMapping(value = "addItem.do", method = RequestMethod.GET)
	public String addItemForm() {
		return "product/addItem";
	}
}
