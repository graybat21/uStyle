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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Item;
import com.ustyle.domain.Product;
import com.ustyle.domain.Purchase;
import com.ustyle.domain.Sales;
import com.ustyle.domain.User;
import com.ustyle.service.CartService;
import com.ustyle.service.ItemService;
import com.ustyle.service.ProductService;
import com.ustyle.service.SalesService;

@Controller
@RequestMapping("/checkout/*")
public class CheckoutController {
	
	private static final Logger logger = LoggerFactory.getLogger(CheckoutController.class);
	private static final int SHIPPING_PRICE = 3000;
	
	@Inject
	private ProductService productService;
	
	@Inject
	private ItemService itemService;
	
	@Inject
	private CartService cartService;
	
	@Inject
	private SalesService salesService;
	
	@ResponseBody
	@RequestMapping(value = "checkout.do", method = RequestMethod.POST)
	public ModelAndView checkout(HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("checkout/checkout/결제 정보");
		
		User user = (User) session.getAttribute("session_user");
		String username = user.getUsername();
		logger.info("login User: " + username);
		
		List<HashMap<String, Object>> userSelectedItemidList = cartService.selectUserItemidList(username);
		
		int totalPrice = 0;		// 배송비를 제외한 가격
		int shippingPrice = 0;	// 배송비
		int finalPrice = 0;		// 배송비를 포함한 가격
		int point = user.getPoint();	// 사용자 포인트
		
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
			
			Item eachItem = itemService.read(eachItemid);
			int eachStock = eachItem.getStock();
			
			if ( eachTotalCount > eachStock )
			{
				Product outofStockProduct = productService.read(eachItem.getProductid());
				Item outofStockItem = eachItem;
				
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
			
			int eachItemPrice = (int) map.get("saleprice");
			
			totalPrice += ( eachItemPrice * eachTotalCount );
		}
		
		mav.addObject("userSelectedItemidList", userSelectedItemidList);
		
		if ( totalPrice < 30000 )
		{
			finalPrice = totalPrice + SHIPPING_PRICE;
			shippingPrice = SHIPPING_PRICE;
		}
		else
		{
			finalPrice = totalPrice;
			shippingPrice = 0;
		}
		
		mav.addObject("totalPrice", totalPrice);
		mav.addObject("shippingPrice", shippingPrice);
		mav.addObject("finalPrice", totalPrice);
		mav.addObject("point", point);
		
		logger.info("TOTAL PRICE: " + totalPrice);
		
		return mav;
	}
	
	@RequestMapping(value = "checkoutSuccess.do", method = RequestMethod.POST)
	public ModelAndView checkoutSuccess(HttpSession session, 
			@ModelAttribute Purchase purchase) throws Exception {
		
		ModelAndView mav = new ModelAndView("checkout/checkoutSuccess/결제 성공");
		
		User user = (User) session.getAttribute("session_user");
		String username = user.getUsername();
		
		purchase.setUsername(username);
		
		logger.info("BEFORE PURCHASE = " + purchase.toString());
		
		salesService.insertPurchase(purchase);
		
		logger.info("AFTER PURCHASE = " + purchase.toString());
		
		int purchaseid = purchase.getPurchaseid();

		List<Sales> salesList = salesService.selectUserCartListForPurchase(username);
		
		for ( Sales sales : salesList )
		{
			sales.setPurchaseid(purchaseid);
			salesService.insert(sales);
			logger.info("SALES = " + sales.toString());
		}
		
		cartService.deleteAll(username);		// 장바구니 비우기
		
		return mav;
		
	}
}