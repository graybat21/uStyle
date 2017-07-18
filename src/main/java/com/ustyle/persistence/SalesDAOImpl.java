package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Purchase;
import com.ustyle.domain.Sales;

@Repository
public class SalesDAOImpl implements SalesDAO {
	
	private static String namespace = "com.ustyle.mappers.salesMapper";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void insert(Sales sales) {
		session.insert(namespace + ".insert", sales);
	}
	
	@Override
	public List<Sales> selectUserCartListForPurchase(String username) {
		return session.selectList(namespace + ".selectUserCartListForPurchase", username);
	}

	@Override
	public void insertPurchase(Purchase purchase) {
		session.insert(namespace + ".insertPurchase", purchase);
	}
	
	@Override
	public void updateAddPoint(HashMap<String, Object> addPointMap) {
		session.update(namespace + ".updateAddPoint", addPointMap);
	}

	@Override
	public void updateUsedPoint(Purchase purchase) {
		session.update(namespace + ".updateUsedPoint", purchase);
	}

	@Override
	public HashMap<String, Object> selectSalesForDaterange(HashMap<String, Object> dateMap) {
		return session.selectOne(namespace + ".selectSalesForDaterange", dateMap);
	}

	@Override
	public List<HashMap<String, Object>> selectSalesForDaterangeAndPagination(HashMap<String, Object> dateMap) {
		return session.selectList(namespace + ".selectSalesForDaterangeAndPagination", dateMap);
	}
	
	@Override
	public HashMap<String, Object> selectSalesForDate(HashMap<String, Object> userMap) {
		return session.selectOne(namespace + ".selectSalesForDate", userMap);
	}

	@Override
	public List<HashMap<String, Object>> selectSalesDetail(int purchaseid) {
		return session.selectList(namespace + ".selectSalesDetail", purchaseid);
	}
}