package com.ustyle.controller;

import java.util.HashMap;
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
	public ModelAndView productList(@RequestParam(value = "pageCount", required = false) Integer pageCount, 
		@RequestParam(value = "countPerPage", required = false) Integer countPerPage, 
		@RequestParam(value = "subcategory", required = false) String subcategory, 
		@RequestParam(value="sortby",  defaultValue="productid") String sortby) throws Exception {
		// http://localhost:8080/product/productList.do?subcategory=Blouses&page=2&countPerPage=12
		// &sortby=productid
		PageMaker pagemaker = new PageMaker();
		
		int page = ( pageCount != null ) ? pageCount.intValue() : 1;
		pagemaker.setPage(page);
		
		ModelAndView mav = new ModelAndView("product/productList/상품 리스트");
		
		int totalCnt = service.selectListCntForSubcategory(subcategory); // DB연동_ 총 갯수 구해오기
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int countPerPaging = 10;
		
		int pageCnt = ( countPerPage != null ) ? countPerPage.intValue() : 12;
		
		pagemaker.setCount(totalCnt, pageCnt, countPerPaging);

		int first = ((pagemaker.getPage() - 1) * pageCnt) + 1;
		int last = ( first + pageCnt - 1 > totalCnt ) ? totalCnt : first + pageCnt - 1;
		map.put("first", first);
		map.put("last", last);
		map.put("subcategory", subcategory);
		map.put("sortby", sortby);
		List<Product> productList = service.productListForSubcategory(map);
		
//		for ( Product p : productList )
//			logger.info(p.toString());
		
		mav.addObject("productList", productList);
		mav.addObject("subcategory", subcategory);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("pageMaker", pagemaker);
		
		return mav;
		
	}
	
	@RequestMapping(value = "productDetail.do", method = RequestMethod.GET)
	public ModelAndView productDetail(@RequestParam(value = "productid", required = false) 
						Integer productid) throws Exception {
		ModelAndView mav = new ModelAndView("product/productDetail/상품 상세");
		Product product = service.read(productid);
		
		String mainPictureUrl = product.getMainpictureurl();
		
		product.setMainpictureurl(mainPictureUrl.replace("/s_", "/"));
		
		logger.info(product.toString());
		
		mav.addObject("product", product);
		return mav;
	}
}
