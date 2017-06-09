package com.ustyle.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Item;
import com.ustyle.domain.Product;
import com.ustyle.service.ItemService;
import com.ustyle.utils.PageMaker;

@Controller
@RequestMapping("/admin/item/*")
public class ItemController {

	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@Inject
	private ItemService service;

	@RequestMapping(value = "addItem.do", method = RequestMethod.GET)
	public String addItemForm(@RequestParam(value = "productid", required = false) String productid, Model model)
			throws Exception {
//		if (productid == null) {		// NPE 처리
//			productid = String.valueOf(service.getNewProductId());
//		}
		model.addAttribute("productid", productid);
		return "item/addItem";
	}
	
	@RequestMapping(value = "addItem.do", method = RequestMethod.POST)
	public ModelAndView addItem(@ModelAttribute @Valid Item item)
			throws Exception {
		
		logger.info(item.toString());

		ModelAndView mav = new ModelAndView("main/base");

		service.insert(item);
		mav.addObject(item);
		return mav;
	}
	
	@RequestMapping("itemList.do")
	public ModelAndView itemList(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		if(searchKeyword == null || searchKeyword.trim() == ""){
			List<Item> list=new ArrayList<>();
			mav.addObject("itemList", list);
			mav.setViewName("item/itemList");
			return mav;
		}
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = service.selectListCnt(map); // DB연동_ 총 갯수 구해오기
		int countPerPage = 10;
		int countPerPaging = 5;

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		List<Item> list = service.itemList(map);
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		logger.info(list.toString());
		
		mav.addObject("itemList", list);
		mav.addObject("pageMaker", pagemaker);
		mav.setViewName("item/itemList");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		
		return mav;
	}
	
	@RequestMapping(value = "modifyItem.do", method = RequestMethod.GET)
	public String modifyItemForm(@RequestParam("itemid") Integer itemid, 
			Model model) throws Exception {
		
		Item modifyItem = service.read(itemid);
		
		logger.info(modifyItem.toString());
		
		model.addAttribute("item", modifyItem);
//		model.addAttribute("page", page);				// 목록으로 돌아갈 때, 페이지 번호를 유지시킴

		return "item/modifyItem";
	}
	
	@RequestMapping(value = "modifyItem.do", method = RequestMethod.POST)
	public ModelAndView modifyItem(@ModelAttribute @Valid Item item, BindingResult bindingResult)
			throws Exception {

		logger.info(item.toString());

		ModelAndView mav = new ModelAndView("item/itemList");

		service.update(item);
		mav.addObject(item);
		return mav;
	}
	
	@RequestMapping("deleteItem.do")
	public String itemDelete(@RequestParam int itemid) throws Exception {
		service.deleteItem(itemid);
		return "redirect:/admin/item/itemList.do";
	}
}
