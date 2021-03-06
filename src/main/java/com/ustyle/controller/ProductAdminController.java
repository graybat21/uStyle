package com.ustyle.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
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
public class ProductAdminController {

	private static final Logger logger = LoggerFactory.getLogger(ProductAdminController.class);

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
		
		if ( files != null ) // 업로드할 상품의 이미지가 존재하는 경우
		{
			product.setMainpictureurl(files[0]); 		// 대표 이미지 추가
			
			String filesStr = Arrays.toString(files);
			product.setPictureurl(filesStr);
		}

		logger.info(product.toString());

		ModelAndView mav = new ModelAndView("");

		if (bindingResult.hasErrors()) {
			mav.getModel().putAll(bindingResult.getModel());
			mav.setViewName("product/addProduct");
			return mav;
		}

		service.insert(product);
		mav.setViewName("redirect:/admin/product/productList.do");
		return mav;
	}
	
	@RequestMapping(value = "readProduct.do", method = RequestMethod.GET)
	public String readProduct(@RequestParam("productid") Integer productid, @RequestParam("page") Integer page, 
				 Model model) throws Exception
	{
		Product readProduct = service.read(productid);

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
		String[] imageFiles = readPictureUrl.split(", ");
		List<String> readPictureList = new ArrayList<String>(Arrays.asList(imageFiles));
		
		for ( String pictureUrl : readPictureList )
			logger.info(pictureUrl.toString());
		
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
	public ModelAndView modifyProduct(@ModelAttribute @Valid Product product, int page, 
			String searchOption, String searchKeyword) throws Exception {

		String[] files = product.getFiles();
		
		if ( files != null ) // 업로드할 상품의 이미지가 존재하는 경우
		{
			product.setMainpictureurl(files[0]); 		// 대표 이미지 수정
			
			String filesStr = Arrays.toString(files);
			product.setPictureurl(filesStr);
		}

		logger.info(product.toString());

		ModelAndView mav = new ModelAndView();

		service.update(product);
		
		int productid = product.getProductid();
		
		if ( searchKeyword != null ) {
			searchKeyword = URLEncoder.encode(searchKeyword, "UTF-8");		// 한글이 깨져나오지 않게 하기 위한 처리
			mav.setViewName("redirect:/admin/product/readProduct.do?productid=" + productid +"&page=" + page + "&o=" + searchOption + "&k=" + searchKeyword);
		}
		else
			mav.setViewName("redirect:/admin/product/readProduct.do?productid=" + productid + "&page=" + page);
		
		mav.addObject(product);
		return mav;
	}

	@RequestMapping("productList.do")
	public ModelAndView productList(PageMaker pagemaker, @RequestParam(value = "o", required = false) String searchOption,
			@RequestParam(value = "k", required = false) String searchKeyword) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		if ( searchKeyword != null )
			searchKeyword = searchKeyword.trim();
		
		HashMap<String, Object> map = new HashMap<String, Object>();

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
			
			if (temp.length() < 50)
				temp = "/ustylenone.jpg";
			else
				temp = temp.substring(1, 55);

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
	
	@ResponseBody
	@RequestMapping(value = "isDeleteProduct.do", method = RequestMethod.POST)
	public ResponseEntity<String> isDeleteProduct(@RequestBody Product product) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		int productid = product.getProductid();
		boolean isExistProduct = true;
		
		try 
		{
			isExistProduct = service.existSalesAndPinTable(productid);
				
			if ( isExistProduct == true ) {
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
	@RequestMapping(value = "deleteProduct.do", method = RequestMethod.POST)
	public ResponseEntity<String> productDelete(@RequestBody Product product) throws Exception {
			
		ResponseEntity<String> entity = null;
		
		try 
		{
			logger.info("PRODUCT TO DELETE = " + product);
			
			int productid = product.getProductid();
			service.delete(productid);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch ( Exception e ) 
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		// => product가 지워질 때, no action 제약조건으로 DB가 설계되었으므로, Service 단에서 product에 해당하는 item을 지우는 방향으로 진행
	}
}
