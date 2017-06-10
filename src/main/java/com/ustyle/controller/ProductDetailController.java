package com.ustyle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ustyle.utils.PageMaker;

@Controller
@RequestMapping("/product/*")
public class ProductDetailController {
	
	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public String productList(PageMaker pagemaker, 
		@RequestParam(value = "subcategory", required = false) String subcategory) throws Exception {
		
		return "product/productList/상품 리스트";
		
	}
}
