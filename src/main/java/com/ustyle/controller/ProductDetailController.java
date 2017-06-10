package com.ustyle.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Product;
import com.ustyle.service.ProductService;
import com.ustyle.utils.PageMaker;

@Controller
@RequestMapping("/product/*")
public class ProductDetailController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductDetailController.class);

	@Inject
	private ProductService service;
	
	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public ModelAndView productList(PageMaker pagemaker, 
		@RequestParam(value = "rowsPerPage", required = false) Integer rowsPerPage, 
		@RequestParam(value = "subcategory", required = false) String subcategory) throws Exception {
		
		ModelAndView mav = new ModelAndView("product/productList/상품 리스트");
		
		List<Product> productList = service.productListForSubcategory(subcategory);
		mav.addObject("productList", productList);
		for ( Product p : productList )
			logger.info(p.toString());
		
//		logger.info(pagemaker.toString());
//		System.out.println(rowsPerPage.intValue());
		
		return mav;
		
	}
}
