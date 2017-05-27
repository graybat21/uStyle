package com.ustyle.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.ustyle.domain.Product;
import com.ustyle.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	private ProductDAO dao;

	@Transactional
	@Override
	public void insert(Product product) throws Exception {
		dao.insert(product);
		
		String[] files = product.getFiles();
		
		String filesStr = Arrays.toString(files);
		
		System.out.println(filesStr);
		
		if ( files == null ) 
			return;
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public Product read(Integer productid) throws Exception {
		return dao.read(productid);
	}
	
	@Transactional
	@Override
	public String selectPictureurl(Integer productid) throws Exception {
		return dao.selectPictureUrl(productid);
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
	public void delete(int productid) throws Exception {
		dao.delete(productid);
	}

	@Override
	public int getNewProductId() throws Exception {
		return dao.getNewProductId();
	}

	


	
//	@Transactional
//	@Override
//	public User userLogin(User user) throws Exception {
//		return dao.userLogin(user);
//	}
//
//	@Transactional
//	@Override
//	public boolean userAuthOk(User user) throws Exception {
//		return dao.userAuthOk(user);
//	}
//
//	@Override
//	public void userAuthInitialize(String username) throws Exception {
//		dao.userAuthInitialize(username);
//	}
//	
//	@Transactional
//	@Override
//	public int userExist(String username) throws Exception {
//		return dao.userExist(username);
//	}
//	
//	@Transactional
//	@Override
//	public void update(User user) throws Exception {
//		dao.update(user);
//	}
//	
//	@Transactional
//	@Override
//	public void delete(String username) throws Exception {
//		dao.delete(username);
//	}
//
//	@Override
//	public int selectListCnt() throws Exception {
//		return dao.selectListCnt();
//	}
//
//	@Override
//	public List<User> userList(HashMap<String, Object> map) throws Exception {
//		return dao.userList(map);
//	}
	
	
}
