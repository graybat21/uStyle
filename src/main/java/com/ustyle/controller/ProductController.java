package com.ustyle.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Item;
import com.ustyle.domain.Product;
import com.ustyle.service.ItemService;
import com.ustyle.service.ProductService;
import com.ustyle.utils.PageMaker;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	private ProductService productService;
	
	@Inject
	private ItemService itemService;
	
	/**
	 * 특정 카테고리에 대한 상품 리스트를 불러옴(옵션에 따른 정렬 가능)
	 * 
	 * @param pageCount
	 * @param countPerPage
	 * @param subcategory
	 * @param brand
	 * @param sortby
	 * @return mav
	 * @throws Exception
	 */
	
	@RequestMapping(value = "productList.do", method = RequestMethod.GET)
	public ModelAndView productList(@RequestParam(value = "pageCount", required = false) Integer pageCount, 
		@RequestParam(value = "countPerPage", required = false) Integer countPerPage, 
		@RequestParam(value = "subcategory", required = false) String subcategory, 
		@RequestParam(value = "brand", required = false) String brand, 
		@RequestParam(value = "sortby",  defaultValue = "productid") String sortby) throws Exception {

		PageMaker pageMaker = new PageMaker();
		
		int page = ( pageCount != null ) ? pageCount.intValue() : 1;
		pageMaker.setPage(page);
		
		ModelAndView mav = new ModelAndView("product/productList/" + subcategory);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("subcategory", subcategory);
		map.put("brand", brand);
		
		int totalCnt = productService.selectListCntForSubcategory(map); // DB연동_ 총 갯수 구해오기
		
		int countPerPaging = 10;
		
		int pageCnt = ( countPerPage != null ) ? countPerPage.intValue() : 12;
		
		pageMaker.setCount(totalCnt, pageCnt, countPerPaging);
		
		logger.info("SORTBY = " + sortby);

		int first = ((pageMaker.getPage() - 1) * pageCnt) + 1;
		int last = ( first + pageCnt - 1 > totalCnt ) ? totalCnt : first + pageCnt - 1;
		
		map.put("first", first);
		map.put("last", last);
		map.put("sortby", sortby);
		
		List<Product> productList = productService.productListForSubcategory(map);
		List<HashMap<String,Object>> brandList = productService.brandListForSubcategory(subcategory);
		List<HashMap<String,Object>> subcategoryList = productService.subcategoryListForSubcategory(subcategory);
		List<HashMap<String,Object>> priceList = productService.priceRangeForSubcategory(subcategory);

		logger.info(brandList.toString());
		mav.addObject("productList", productList);
		mav.addObject("brandList", brandList);
		mav.addObject("subcategoryList", subcategoryList);
		mav.addObject("priceList", priceList);
		
		mav.addObject("subcategory", subcategory);
		mav.addObject("brand", brand);
		mav.addObject("sortby", sortby);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
		
	}
	
	/**
	 * 상품 상세정보를 상세페이지에 불러옴
	 * 
	 * @param productid
	 * @return mav
	 * @throws Exception
	 */
	
	@RequestMapping(value = "productDetail.do", method = RequestMethod.GET)
	public ModelAndView productDetail(@RequestParam(value = "productid", required = false) 
						Integer productid) throws Exception {
		
		Product product = productService.read(productid);
		
		ModelAndView mav = new ModelAndView("product/productDetail/" + product.getProductname());
		
		String mainPictureurl = product.getMainpictureurl();
		product.setMainpictureurl(mainPictureurl.replace("/s_", "/"));
		
		String readPictureurl = product.getPictureurl().replaceAll("\\[|\\]", "");
		String[] imageFiles = readPictureurl.split(", ");
		List<String> pictureList = new ArrayList<String>(Arrays.asList(imageFiles));
		
		logger.info(product.toString());
		
		List<String> itemColorList = itemService.selectColorList(productid);		// 상품의 색상을 리스트로 가져옴
		
		int totalItemNum = itemService.totalItem(productid);		// 하나의 상품에 속하는 아이템의 총 개수 
		
		mav.addObject("product", product);
		mav.addObject("totalItemNum", totalItemNum);
		mav.addObject("pictureList", pictureList);
		mav.addObject("itemColorList", itemColorList);
		
		return mav;
	}
	
	/**
	 * 선택된 색상에 해당하는 Item 객체 리스트를 가져옴
	 * 
	 * @param selectedColorItem
	 * @return selectedColorItemList
	 * @throws Exception
	 */
	
	@ResponseBody
	@RequestMapping(value = "selectedColor.do", method = RequestMethod.POST)
	public List<Item> selectedColorAjax(@RequestBody Item selectedColorItem) throws Exception {
		
		List<Item> selectedColorItemList = itemService.selectedColorItemList(selectedColorItem);
		
		for ( Item eachItem : selectedColorItemList )
			logger.info(eachItem.toString());
		
		return selectedColorItemList;
	}
	
	/**
	 * 선택된 색상, 사이즈에 해당하는 Item 객체 한 개를 가져옴
	 * 
	 * @param selectedSizeItem
	 * @return selectedColorSizeItem
	 * @throws Exception
	 */
	
	@ResponseBody
	@RequestMapping(value = "selectedSize.do", method = RequestMethod.POST)
	public Item selectedSizeAjax(@RequestBody Item selectedSizeItem) throws Exception {
		
		Item selectedColorSizeItem = itemService.selectedColorSizeItem(selectedSizeItem);
		
		logger.info(selectedColorSizeItem.toString());
		
		return selectedColorSizeItem;
	}
}
