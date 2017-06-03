package com.ustyle.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Product;
import com.ustyle.service.ProductService;
import com.ustyle.utils.PageMaker;

@Controller
@RequestMapping("/admin/product/*")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	private ProductService service;

	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "addProduct.do", method = RequestMethod.GET)
	public String addProductForm() {
		return "product/addProduct";
	}

	@RequestMapping(value = "addProduct.do", method = RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute @Valid Product product, BindingResult bindingResult)
			throws Exception {
		
		String[] files = product.getFiles();

		if (files != null) // 업로드할 상품의 이미지가 존재하는 경우
		{
			String filesStr = Arrays.toString(files);
			product.setPictureurl(filesStr);
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
	}
	
	@RequestMapping(value = "readProduct.do", method = RequestMethod.GET)
	public String readProduct(@RequestParam("productid") Integer productid, @RequestParam("page") Integer page, 
				 Model model) throws Exception
	{
		Product readProduct = service.read(productid);
		
//		String[] imageFiles = readProduct.getPictureurl().split(",");
//		readProduct.setFiles(imageFiles);

		logger.info(readProduct.toString());
		
		model.addAttribute("product", readProduct);
		model.addAttribute("page", page);				// 목록으로 돌아갈 때, 페이지 번호를 유지시킴

		return "product/readProduct";
	}
	
	@RequestMapping("readProductImage/{productid}")
	@ResponseBody
	public List<String> readProductImage(@PathVariable("productid") Integer productid) throws Exception
	{
		String readPictureUrl = service.selectPictureurl(productid).replaceAll("\\[|\\]", "");
		String[] imageFiles = readPictureUrl.split(",");
		List<String> readPictureList = new ArrayList<String>(Arrays.asList(imageFiles));
		readPictureList = readPictureList.stream().map(String :: trim).collect(Collectors.toList());		// 리스트 각 요소의 앞뒤 공백을 없애줌(Java 1.8부터 사용 가능)
		
		for ( String aaa : readPictureList )
			logger.info(aaa.toString());
		
		return readPictureList;
	}
	
	@RequestMapping(value = "modifyProduct.do", method = RequestMethod.GET)
	public String modifyProductForm(@RequestParam("productid") Integer productid, 
			@RequestParam("page") Integer page, Model model) throws Exception {
		
		Product modifyProduct = service.read(productid);
		
		logger.info(modifyProduct.toString());
		
		model.addAttribute("product", modifyProduct);
		model.addAttribute("page", page);				// 목록으로 돌아갈 때, 페이지 번호를 유지시킴

		 return "product/modifyProduct";
	}
	
	@RequestMapping(value = "modifyProduct.do", method = RequestMethod.POST)
	public ModelAndView modifyProduct(@ModelAttribute @Valid Product product, BindingResult bindingResult)
			throws Exception {

		String[] files = product.getFiles();

		if (files != null) // 업로드할 상품의 이미지가 존재하는 경우
		{
			String filesStr = Arrays.toString(files);
			product.setPictureurl(filesStr);
		}

		logger.info(product.toString());

		ModelAndView mav = new ModelAndView("main/base");

		service.update(product);
		mav.addObject(product);
		return mav;
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
	public ModelAndView productList(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
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
		String temp = null;
		for (int i = 0; i < list.size(); i++) {
			temp = list.get(i).getPictureurl();
			if (temp.length() < 50) {
				temp = "/ustylenone.jpg";
			} else {
				temp = temp.substring(1, 55);
			}
			System.out.println(temp);
			list.get(i).setPictureurl(temp);
		}
		mav.addObject("productList", list);
		mav.addObject("pageMaker", pagemaker);
		mav.setViewName("product/productList");
		mav.addObject("searchOption", searchOption);
		mav.addObject("searchKeyword", searchKeyword);
		mav.addObject("uploadPath", uploadPath);
		return mav;
	}

	@RequestMapping("deleteProduct.do")
	public String productDelete(@RequestParam int productid) throws Exception {
		service.delete(productid);
		// => product가 지워질 때, no action 제약조건으로 DB가 설계되었으므로, Service 단에서 product에 해당하는 item을 지우는 방향으로 진행
		return "redirect:/admin/product/productList.do";
	}
}
