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
import com.ustyle.service.UserService;

@Controller
@RequestMapping("/checkout/*")
public class CheckoutController {
	
	private static final Logger logger = LoggerFactory.getLogger(CheckoutController.class);
	private static final int SHIPPING_PRICE = 3000;
	
	@Inject
	private UserService userService;
	
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
		ModelAndView mav = new ModelAndView("checkout/checkout/상품 결제");
		
		User user = (User) session.getAttribute("session_user");
		String username = user.getUsername();
		logger.info("login User: " + username);
		
		List<HashMap<String, Object>> userSelectedItemidList = cartService.selectUserItemidList(username);
		
		int totalPrice = 0;		// 諛곗넚鍮꾨�� �젣�쇅�븳 媛�寃�
		int shippingPrice = 0;	// 諛곗넚鍮�
		int finalPrice = 0;		// 諛곗넚鍮꾨�� �룷�븿�븳 媛�寃�
		int point = user.getPoint();	// �궗�슜�옄 �룷�씤�듃
		
		for ( HashMap<String, Object> map : userSelectedItemidList )
		{
			Iterator<String> iterator = map.keySet().iterator();
		    while (iterator.hasNext()) {
		        String key = (String) iterator.next();
		        logger.info("key = " + key);
		        logger.info(" value = " + map.get(key));
		    }
		    
			int eachItemid = (Integer) map.get("itemid");
			int eachTotalCount = Integer.parseInt(String.valueOf(map.get("totalcount")));		
			// HashMap<String, Object>�쑝濡� 諛쏆쓣 �븣, MySQL sum �븿�닔瑜� �씠�슜�븳 媛믪쓣 int�삎�쑝濡� 諛쏆� 紐삵븯誘�濡�, �쐞�� 媛숈씠 String�쑝濡� 諛쏆� �썑 int濡� �떎�떆 蹂��솚�븯���떎.
			
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
			
			int eachItemPrice = (Integer) map.get("saleprice");
			
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
		mav.addObject("finalPrice", finalPrice);
		mav.addObject("point", point);
		
		logger.info("TOTAL PRICE: " + totalPrice);
		
		return mav;
	}
	
	@RequestMapping(value = "checkoutSuccess.do", method = RequestMethod.POST)
	public ModelAndView checkoutSuccess(HttpSession session, 
			@ModelAttribute Purchase purchase, Integer totalprice) throws Exception {
		
		ModelAndView mav = new ModelAndView("checkout/checkoutSuccess/결제 성공");
		
		User user = (User) session.getAttribute("session_user");
		String username = user.getUsername();
		
		purchase.setUsername(username);
		
		logger.info("FINAL PRICE = " + totalprice);
		logger.info("BEFORE PURCHASE = " + purchase.toString());
		
		double point_ratio = userService.selectUserPointRatio(username);
		int addpoint = (int) (totalprice * point_ratio);
		logger.info("ADD POINT = " + addpoint);
		
		HashMap<String, Object> addPointMap = new HashMap<String, Object>();
		addPointMap.put("username", username);
		addPointMap.put("addpoint", addpoint);

		salesService.updateAddPoint(addPointMap);
		salesService.insertPurchase(purchase);
		
		logger.info("AFTER PURCHASE = " + purchase.toString());
		
		int purchaseid = purchase.getPurchaseid();
		
		int pointAfterPurchase = userService.selectOneUser(username).getPoint(); 

		session.setAttribute("session_userpoint", pointAfterPurchase);
		
		List<Sales> salesList = salesService.selectUserCartListForPurchase(username);
		
		for ( Sales sales : salesList )
		{
			sales.setPurchaseid(purchaseid);
			salesService.insert(sales);
			logger.info("SALES = " + sales.toString());
		}
		
		cartService.deleteAll(username);		// �옣諛붽뎄�땲 鍮꾩슦湲�
		
		return mav;
		
	}
}