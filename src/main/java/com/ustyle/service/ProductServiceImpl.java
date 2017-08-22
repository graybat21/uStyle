package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.ustyle.domain.Product;
import com.ustyle.domain.Review;
import com.ustyle.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO dao;

	@Transactional
	@Override
	public void insert(Product product) throws Exception {
		dao.insert(product);
	}
	
	@Override
	public void writeReview(Review review) throws Exception {
		dao.writeReview(review);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public Product read(Integer productid) throws Exception {
		return dao.read(productid);
	}

	@Transactional
	@Override
	public String selectPictureurl(Integer productid) throws Exception {
		return dao.selectPictureurl(productid);
	}
	
	@Transactional
	@Override
	public String selectMainpictureurl(Integer productid) throws Exception {
		return dao.selectMainpictureurl(productid);
	}

	@Override
	public int selectListCnt(HashMap<String, Object> map) throws Exception {
		return dao.selectListCnt(map);
	}

	@Override
	public List<Product> productList(HashMap<String, Object> map) throws Exception {
		return dao.productList(map);
	}

	@Override
	public int selectListCntForSubcategory(HashMap<String, Object> map) throws Exception {
		return dao.selectListCntForSubcategory(map);
	}

	@Override
	public List<Product> productListForSubcategory(HashMap<String, Object> map) throws Exception {
		return dao.productListForSubcategory(map);
	}
	
	@Override
	public void update(Product product) throws Exception {
		dao.update(product);
	}
	
	@Override
	public boolean existSalesAndPinTable(int productid) throws Exception {
		boolean isExistTable = ( dao.existSalesTable(productid) || dao.existPinTable(productid) );
		return isExistTable;
	}

	@Override
	public void delete(int productid) throws Exception {
		dao.deleteItem(productid);
		dao.delete(productid);
	}

	@Override
	public int getNewProductId() throws Exception {
		return dao.getNewProductId();
	}

	@Override
	public List<HashMap<String, Object>> brandListForSubcategory(String subcategory) throws Exception {
		return dao.brandListForSubcategory(subcategory);
	}

	@Override
	public List<HashMap<String, Object>> subcategoryListForSubcategory(String subcategory) throws Exception {
		return dao.subcategoryListForSubcategory(subcategory);
	}

	@Override
	public List<HashMap<String, Object>> priceRangeForSubcategory(String subcategory) throws Exception {
		return dao.priceRangeForSubcategory(subcategory);
	}
	

}
