package com.ustyle.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Item;
import com.ustyle.domain.Product;
import com.ustyle.domain.User;
import com.ustyle.service.CartService;
import com.ustyle.service.ItemService;
import com.ustyle.service.ProductService;

@Controller
@RequestMapping("/checkout/*")
public class CheckoutController {
	
	private static final Logger logger = LoggerFactory.getLogger(CheckoutController.class);
	
	@Inject
	private ProductService productService;
	
	@Inject
	private ItemService itemService;
	
	@Inject
	private CartService cartService;
	
	@RequestMapping(value = "checkout.do", method = RequestMethod.POST)
	public ModelAndView checkout(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("checkout/checkoutSuccess/결제 정보");
		
		User user = (User) session.getAttribute("session_user");
		String username = user.getUsername();
		logger.info("login User: " + username);
		
		List<HashMap<String, Object>> userSelectedItemidList = cartService.selectUserItemidList(username);
		
		for ( HashMap<String, Object> map : userSelectedItemidList )
		{
			Iterator<String> iterator = map.keySet().iterator();
		    while (iterator.hasNext()) {
		        String key = (String) iterator.next();
		        logger.info("key = " + key);
		        logger.info(" value = " + map.get(key));
		    }
		    
			int eachItemid = (int) map.get("itemid");
			int eachTotalCount = Integer.parseInt(String.valueOf(map.get("totalcount")));		
			// HashMap<String, Object>으로 받을 때, MySQL sum 함수를 이용한 값을 int형으로 받지 못하므로, 위와 같이 String으로 받은 후 int로 다시 변환하였다.
			
			int eachStock = itemService.read(eachItemid).getStock();
			
			if ( eachTotalCount > eachStock )
			{
				Product outofStockProduct = productService.read(itemService.read(eachItemid).getProductid());
				Item outofStockItem = itemService.read(eachItemid);
				
				String outofStockProductname = outofStockProduct.getProductname();
				String outofStockColor = outofStockItem.getColor();
				String outofStockSize = outofStockItem.getSize();
				
				mav.addObject("outofStockProductname", outofStockProductname);
				mav.addObject("outofStockColor", outofStockColor);
				mav.addObject("outofStockSize", outofStockSize);
				mav.addObject("maxStock", eachStock);
				
				mav.setViewName("checkout/checkoutFail/결제 오류");
				return mav;
			}
		}
		
		
		return mav;
	}
}