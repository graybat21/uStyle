package com.ustyle.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
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

import com.ustyle.domain.Product;
import com.ustyle.domain.User;
import com.ustyle.service.ProductService;
import com.ustyle.utils.PageMaker;
import com.ustyle.utils.ProductUploadValidator;

@Controller
@RequestMapping("/admin/product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	private ProductService service;

	@Inject
	private ProductUploadValidator validator;

	@RequestMapping(value = "addProduct.do", method = RequestMethod.GET)
	public String addProductForm() {
		return "product/addProduct";
	}

	@RequestMapping(value = "addProduct.do", method = RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute @Valid Product product, BindingResult bindingResult)
			throws Exception {

		validator.validate(product, bindingResult);
		String[] files = product.getFiles();

		if (files != null) // 업로드할 상품의 이미지가 존재하는 경우
		{
			String filesStr = Arrays.toString(files);
			product.setPictureUrl(filesStr);
		}

		logger.info(product.toString());

		ModelAndView mav = new ModelAndView("main/base");

		if (bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			mav.setViewName("product/addProduct");
			return mav;
		}

		service.insert(product);
		mav.addObject(product);
		return mav;

		// return "redirect:/admin/main.do";
	}

	@RequestMapping(value = "addItem.do", method = RequestMethod.GET)
	public String addItemForm(@RequestParam(value = "productid", required = false) String productid, Model model)
			throws Exception {
		if (productid == null) {
			productid = String.valueOf(service.getNewProductId());
		}
		model.addAttribute("productid", productid);
		return "product/addItem";
	}

	@RequestMapping("productList.do")
	public ModelAndView userList(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		// map.put("searchKeyword", searchKeyword);
		int page = pagemaker.getPage() != null ? pagemaker.getPage() : 1;
		pagemaker.setPage(page);
		map.put("searchOption", searchOption);
		map.put("searchKeyword", searchKeyword);
		int totalCnt = service.selectListCnt(map); // DB연동_ 총 갯수 구해오기
		int countPerPage = 10;
		int countPerPaging = 5;

		int first = ((pagemaker.getPage() - 1) * countPerPage) + 1;
		int last = first + countPerPage - 1;
		map.put("first", first);
		map.put("last", last);
		List<Product> list = service.productList(map);
		pagemaker.setCount(totalCnt, countPerPage, countPerPaging);
		logger.info(list.toString());
		mav.addObject("productList", list);
		mav.addObject("pageMaker", pagemaker);
		mav.setViewName("product/productList");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		return mav;
	}

	@RequestMapping("deleteProduct.do")
	public String productDelete(@RequestParam int productid) throws Exception {
		service.delete(productid);
		return "redirect:/admin/product/productList.do";
	}
}
