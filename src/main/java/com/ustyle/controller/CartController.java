package com.ustyle.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

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

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Inject
	private CartService cartService;
	
	/**
	 * 상품의 상세페이지에서 옵션을 선택한 후 장바구니 추가 버튼을 눌렀을 때 호출되며, 호출 후 장바구니 페이지로 리다이렉션됨.
	 * 
	 * @param cart
	 * @param session
	 * @return mav
	 * @throws Exception
	 */
	
	@RequestMapping(value = "addCart.do", method = RequestMethod.POST)
	public ModelAndView productToCart(@ModelAttribute Cart cart, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		User user = (User) session.getAttribute("session_user");
		String username = user.getUsername();
		
		if ( cartService.selectCartItemsCountForUsername(username) == 10 )		
		{	// 장바구니에 담긴 상품이 10개인 경우, 장바구니에 담긴 상품을 빼도록 유도함
			mav.setViewName("cart/addtoCartFail/상품 추가 오류");
			return mav;
		}
		
		cart.setUsername(username);
		logger.info(cart.toString());
		cartService.insert(cart);
		mav.setViewName("redirect:/cart/viewCart.do");
		return mav;
	}
	
	/**
	 * 로그인한 회원의 장바구니 페이지를 조회함
	 * 
	 * @param session
	 * @return mav
	 * @throws Exception
	 */
	
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
		
		ModelAndView mav = new ModelAndView("cart/viewCart/장바구니");
		mav.addObject("userCartInfoList", userCartInfoList);
		mav.addObject("cartCount", userCartInfoList.size());
		mav.addObject("totalPrice", totalPrice);
		
		return mav;
		
	}
	
	/**
	 * 장바구니에 있는 Item의 수량을 바꾼 후, 수정 버튼을 눌렀을 때 호출됨
	 * 
	 * @param cart
	 * @return updatedItemCart
	 * @throws Exception
	 */
	
	@ResponseBody
	@RequestMapping(value = "updateCart.do", method = RequestMethod.POST)
	public Cart updateCart(@RequestBody Cart cart) throws Exception {
		
		cartService.update(cart);
		int updatedCartno = cart.getCartno();
		
		Cart updatedItemCart = cartService.selectUserCartOne(updatedCartno);
		
		return updatedItemCart;
	}
	
	/**
	 * 장바구니에 있는 특정 Item을 삭제했을 때 호출됨
	 * 
	 * @param cart
	 * @return deletedItemCart
	 * @throws Exception
	 */
	
	@ResponseBody
	@RequestMapping(value = "deleteCart.do", method = RequestMethod.POST)
	public Cart deleteCart(@RequestBody Cart cart) throws Exception {
		
		int deleteCartNo = cart.getCartno();
		
		cartService.delete(deleteCartNo);
		
		Cart deletedItemCart = cartService.selectUserCartOne(deleteCartNo);
		
		return deletedItemCart;
	}
	
	/**
	 * 장바구니에 있는 모든 Item을 삭제할 때 호출됨
	 * 
	 * @param session
	 * @return mav
	 * @throws Exception
	 */
	
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
