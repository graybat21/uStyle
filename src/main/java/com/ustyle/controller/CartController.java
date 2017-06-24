package com.ustyle.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Item;
import com.ustyle.domain.Product;
import com.ustyle.service.ItemService;
import com.ustyle.service.ProductService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Inject
	private ProductService productService;
	
	@Inject
	private ItemService itemService;
	
	@RequestMapping(value = "addCart.do", method = RequestMethod.POST)
	public ModelAndView productToCart(@RequestParam(value = "itemid") Integer itemid, 
			@RequestParam(value = "count") Integer count, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		Item addCartItem = itemService.read(itemid);
		Product addCartProduct = productService.read(addCartItem.getProductid());
		
		logger.info(addCartProduct.toString());
		logger.info(addCartItem.toString());
		System.out.println(count);
		
		System.out.println("zkzkzkkzkzkz");
			mav.setViewName("redirect:/cart/viewCart.do");
			
		return mav;
	}
	
	@RequestMapping(value = "viewCart.do", method = RequestMethod.GET)
	public ModelAndView viewCart() throws Exception {
		// http://localhost:8080/cart/viewCart.do
		
		ModelAndView mav = new ModelAndView("cart/viewCart/장바구니");
		
		return mav;
		
	}
	
	
}
