package com.ustyle.controller;

import java.util.Arrays;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Product;
import com.ustyle.domain.User;
import com.ustyle.service.ProductService;
import com.ustyle.utils.ProductUploadValidator;

@Controller
@RequestMapping("/admin/product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService service;
	
	@Inject
	private ProductUploadValidator validator;

	@RequestMapping(value = "addProduct.do", method = RequestMethod.GET)
	public String addProductForm() {
		return "product/addProduct";
	}
	
	@RequestMapping(value = "addProduct.do", method = RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute @Valid Product product, BindingResult bindingResult) throws Exception {

		validator.validate(product, bindingResult);
		String[] files = product.getFiles();
		
		if ( files != null )		// 업로드할 상품의 이미지가 존재하는 경우
		{
			String filesStr = Arrays.toString(files);	
			product.setPictureUrl(filesStr);
		}
		
		logger.info(product.toString());	
		
		ModelAndView mav = new ModelAndView("main/base");
		
		if (bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			mav.setViewName("product/addProduct");
			return mav;
		}
		
		service.insert(product);
		mav.addObject(product);
		return mav;

		
//		return "redirect:/admin/main.do";
	}
	
	@RequestMapping(value = "addItem.do", method = RequestMethod.GET)
	public String addItemForm() {
		return "product/addItem";
	}
}
