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
	public void insert(Product product) throws Exception {
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
	public int selectListCnt(HashMap<String, Object> map) throws Exception {
		return session.selectOne(namespace + ".selectListCnt", map);
	}

	@Override
	public List<Product> productList(HashMap<String, Object> map) throws Exception {
		return session.selectList(namespace + ".productList", map);
	}

	@Override
	public int selectListCntForSubcategory(HashMap<String, Object> map) throws Exception {
		return session.selectOne(namespace + ".selectListCntForSubcategory", map);
	}

	@Override
	public List<Product> productListForSubcategory(HashMap<String, Object> map) throws Exception {
		return session.selectList(namespace + ".productListForSubcategory", map);
	}

	@Override
	public void update(Product product) throws Exception {
		session.update(namespace + ".update", product);
	}

	@Override
	public void delete(int productid) throws Exception {
		session.delete(namespace + ".delete", productid);
	}

	@Override
	public void deleteItem(int productid) throws Exception {
		session.delete(namespace + ".deleteItem", productid);
	}

	@Override
	public int getNewProductId() throws Exception {
		return session.selectOne(namespace + ".getNewProductId");
	}

	@Override
	public List<HashMap<String, Object>> brandListForSubcategory(String subcategory) throws Exception {
		return session.selectList(namespace + ".brandListForSubcategory", subcategory);
	}

	@Override
	public List<HashMap<String, Object>> subcategoryListForSubcategory(String subcategory) throws Exception {
		return session.selectList(namespace + ".subcategoryListForSubcategory", subcategory);
	}

	@Override
	public List<HashMap<String, Object>> priceRangeForSubcategory(String subcategory) throws Exception {
		return session.selectList(namespace + ".priceRangeForSubcategory", subcategory);
	}

}
