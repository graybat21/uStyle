package com.ustyle.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
@RequestMapping("/admin/item/*")
public class ItemAdminController {

	private static final Logger logger = LoggerFactory.getLogger(ItemAdminController.class);

	@Inject
	private ProductService productService;
	
	@Inject
	private ItemService itemService;
	
	/**
	 * 관리자 페이지에서 특정 상품에 해당하는 Item을 추가하기 위한 페이지를 불러옴
	 * 
	 * @param productid
	 * @return mav
	 * @throws Exception
	 */

	@RequestMapping(value = "addItem.do", method = RequestMethod.GET)
	public ModelAndView addItemForm(@RequestParam(value = "productid", required = false) Integer productid)
			throws Exception {
		
		ModelAndView mav = new ModelAndView("item/addItem");
		
		Product product = productService.read(productid);
		
		int originalprice = product.getOriginalprice();
		int saleprice = product.getSaleprice();
			
		mav.addObject("productid", productid);
		mav.addObject("originalprice", originalprice);
		mav.addObject("saleprice", saleprice);
		return mav;
	}
	
	/**
	 * Item을 추가하는 페이지의 form을 이용하여 Item을 추가함
	 * 
	 * @param item
	 * @return productList
	 * @throws Exception
	 */
	
	@RequestMapping(value = "addItem.do", method = RequestMethod.POST)
	public String addItem(@ModelAttribute @Valid Item item) throws Exception {
		
		logger.info(item.toString());
		itemService.insert(item);
		
		return "redirect:/admin/product/productList.do";
	}
	
	/**
	 * 관리자 페이지에서 특정 옵션에 따른 검색을 통하여 그 조건에 맞는 Item을 호출함
	 * 
	 * @param pageMaker
	 * @param searchOption
	 * @param searchKeyword
	 * @return mav
	 * @throws Exception
	 */
	
	@RequestMapping("itemList.do")
	public ModelAndView itemList(PageMaker pageMaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		if ( searchKeyword != null )
			searchKeyword = searchKeyword.trim();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int page = ( pageMaker.getPage() != null ) ? pageMaker.getPage() : 1;
		pageMaker.setPage(page);
		
		if ( searchKeyword == null || searchKeyword.trim() == "") {
			List<Item> list = new ArrayList<Item>();
			mav.addObject("itemList", list);
			mav.setViewName("item/itemList");
			return mav;
		}
		
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = itemService.selectListCnt(map); // DB연동_ 총 갯수 구해오기
		int countPerPage = 10;
		int countPerPaging = 5;

		int first = ((pageMaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		List<Item> list = itemService.itemList(map);
		pageMaker.setCount(totalCnt, countPerPage, countPerPaging);
		logger.info(list.toString());
		
		mav.addObject("itemList", list);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("item/itemList");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		
		return mav;
	}
	
	/**
	 * Item 정보를 수정하기 위해 불러올 페이지를 호출함
	 * @param itemid
	 * @return mav
	 * @throws Exception
	 */
	
	@RequestMapping(value = "modifyItem.do", method = RequestMethod.GET)
	public ModelAndView modifyItemForm(@RequestParam("itemid") Integer itemid) throws Exception {
		ModelAndView mav = new ModelAndView("item/modifyItem");
		
		Item modifyItem = itemService.read(itemid);
		
		logger.info(modifyItem.toString());
		
		mav.addObject("item", modifyItem);
		return mav;
	}
	
	/**
	 * Item 수정 페이지의 form을 이용하여 Item 수정 작업을 진행함 
	 * 
	 * @param item
	 * @return productList
	 * @throws Exception
	 */
	
	@RequestMapping(value = "modifyItem.do", method = RequestMethod.POST)
	public String modifyItem(@ModelAttribute @Valid Item item) throws Exception {
		logger.info(item.toString());
		itemService.update(item);
		int productid = item.getProductid();
		return "redirect:/admin/item/itemList.do?o=productid&k=" + productid;
	}
	
	@ResponseBody
	@RequestMapping(value = "alreadyExistItem.do", method = RequestMethod.POST)
	public ResponseEntity<String> alreadyExistItem(@RequestBody Item item) throws Exception {
		ResponseEntity<String> entity = null;
		
		boolean isExistItem = true;
		System.out.println(item.toString());
		try 
		{
			isExistItem = itemService.existItem(item);
			
			logger.info("IS EXIST ITEM = " + isExistItem);
			
			if ( isExistItem == true ) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			}
			else {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}	
		}
		catch ( Exception e ) 
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "isDeleteItem.do", method = RequestMethod.POST)
	public ResponseEntity<String> isDeleteItem(@RequestBody Item item) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		int itemid = item.getItemid();
		boolean isExistSalesTable = true;
		
		try 
		{
			isExistSalesTable = itemService.existSalesTable(itemid);
				
			if ( isExistSalesTable == true ) {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			}
			else {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}	
		}
		catch ( Exception e ) 
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	/**
	 * 특정 Item을 삭제함
	 * 
	 * @param itemid
	 * @return itemList 페이지
	 * @throws Exception
	 */
	
	@ResponseBody
	@RequestMapping(value = "deleteItem.do", method = RequestMethod.POST)
	public ResponseEntity<String> itemDelete(@RequestBody Item item) throws Exception {	
		int itemid = item.getItemid();
		ResponseEntity<String> entity = null;
		
		try 
		{
			logger.info("ITEM TO DELETE = " + item);
			itemService.deleteItem(itemid);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch ( Exception e ) 
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
