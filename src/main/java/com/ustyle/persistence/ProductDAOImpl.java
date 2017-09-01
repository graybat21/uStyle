package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Product;
import com.ustyle.domain.Review;

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
	public void writeReview(Review review) throws Exception {
		session.insert(namespace + ".writeReview", review);
	}

	@Override
	public Product read(Integer productid) throws Exception {
		return session.selectOne(namespace + ".read", productid);
	}

	@Override
	public String selectPictureurl(Integer productid) throws Exception {
		return session.selectOne(namespace + ".selectPictureurl", productid);
	}
	
	@Override
	public String selectMainpictureurl(Integer productid) throws Exception {
		return session.selectOne(namespace + ".selectMainpictureurl", productid);
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
	public List<Product> recentProductList() throws Exception {
		return session.selectList(namespace + ".recentProductList");
	}
	
	@Override
	public List<Product> popularProductList() throws Exception {
		return session.selectList(namespace + ".popularProductList");
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
	public int selectListCntForProductname(HashMap<String, Object> map) throws Exception {
		return session.selectOne(namespace + ".selectListCntForProductname", map);
	}
	
	@Override
	public List<Product> productListForProductname(HashMap<String, Object> map) throws Exception {
		return session.selectList(namespace + ".productListForProductname", map);
	}
	
	@Override
	public void update(Product product) throws Exception {
		session.update(namespace + ".update", product);
	}
	
	@Override
	public boolean existSalesTable(int productid) throws Exception {
		return session.selectOne(namespace + ".existSalesTable", productid);
	}
	
	@Override
	public boolean existPinTable(int productid) throws Exception {
		return session.selectOne(namespace + ".existPinTable", productid);
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
