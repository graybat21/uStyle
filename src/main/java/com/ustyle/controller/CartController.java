package com.ustyle.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Cart;
import com.ustyle.domain.User;
import com.ustyle.service.CartService;
import com.ustyle.service.ItemService;
import com.ustyle.service.ProductService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Inject
	private CartService cartService;
	
	@RequestMapping(value = "addCart.do", method = RequestMethod.POST)
	public ModelAndView productToCart(@ModelAttribute Cart cart, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		User user = (User) session.getAttribute("session_user");
		String username = user.getUsername();
		
		cart.setUsername(username);
		
		logger.info(cart.toString());
		
		cartService.insert(cart);
		
		mav.setViewName("redirect:/cart/viewCart.do");
			
		return mav;
	}
	
	@RequestMapping(value = "viewCart.do", method = RequestMethod.GET)
	public ModelAndView viewCart(HttpSession session) throws Exception {
		User user = (User) session.getAttribute("session_user");
		
		String username = user.getUsername();
		logger.info("login User: " + username);
		
		List<HashMap<String, Object>> userCartInfoList = cartService.selectUserCartList(username);
		
		int totalPrice = 0;
		
		for ( HashMap<String, Object> map : userCartInfoList )
		{
			int eachPrice = (Integer) map.get("saleprice");
			int eachCount = (Integer) map.get("count");
			
			totalPrice += eachPrice * eachCount;
			
			Iterator<String> iterator = map.keySet().iterator();
		    while (iterator.hasNext()) {
		        String key = (String) iterator.next();
		        logger.info("key = " + key);
		        logger.info(" value = " + map.get(key));
		    }
		}
		
		logger.info("totalPrice = " + totalPrice);
		
		ModelAndView mav = new ModelAndView("cart/viewCart/�옣諛붽뎄�땲");
		mav.addObject("userCartInfoList", userCartInfoList);
		mav.addObject("cartCount", userCartInfoList.size());
		mav.addObject("totalPrice", totalPrice);
		
		return mav;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "updateCart.do", method = RequestMethod.POST)
	public Cart updateCart(@RequestBody Cart cart) throws Exception {
		
		cartService.update(cart);
		int updatedCartno = cart.getCartno();
		
		Cart updatedItemCart = cartService.selectUserCartOne(updatedCartno);
		
		return updatedItemCart;
	}
	
	@ResponseBody
	@RequestMapping(value = "deleteCart.do", method = RequestMethod.POST)
	public Cart deleteCart(@RequestBody Cart cart) throws Exception {
		
		int deleteCartNo = cart.getCartno();
		
		cartService.delete(deleteCartNo);
		
		Cart deletedItemCart = cartService.selectUserCartOne(deleteCartNo);
		
		return deletedItemCart;
	}
	
	@RequestMapping(value = "deleteAllCart.do", method = RequestMethod.POST)
	public ModelAndView deleteAllCart(HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		User user = (User) session.getAttribute("session_user");
		String username = user.getUsername();
		
		cartService.deleteAll(username);
		
		mav.setViewName("redirect:/cart/viewCart.do");
		
		return mav;
	}
}
