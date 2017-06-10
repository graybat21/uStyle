package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	private static String namespace = "com.ustyle.mappers.productMapper";

	@Inject
	private SqlSession session;

	@Override
	public void insert(Product product) {
		session.insert(namespace + ".insert", product);
	}
	
	@Override
	public Product read(Integer productid) throws Exception {
		return session.selectOne(namespace + ".read", productid);
	}
	
	@Override
	public String selectPictureUrl(Integer productid) throws Exception {
		return session.selectOne(namespace + ".selectPictureUrl", productid);
	}

	@Override
	public int selectListCnt(HashMap<String, Object> map) {
		return session.selectOne(namespace + ".selectListCnt", map);
	}

	@Override
	public List<Product> productList(HashMap<String, Object> map) {
		return session.selectList(namespace + ".productList", map);
	}
	
	@Override
	public List<Product> productListForSubcategory(String subcategory) {
		return session.selectList(namespace + ".productListForSubcategory", subcategory);
	}
	
	@Override
	public void update(Product product) {
		session.update(namespace + ".update", product);
	}

	@Override
	public void delete(int productid) {
		session.delete(namespace + ".delete", productid);
	}
	
	@Override
	public void deleteItem(int productid) {
		session.delete(namespace + ".deleteItem", productid);
	}

	@Override
	public int getNewProductId() {
		return session.selectOne(namespace + ".getNewProductId");
	}
}
