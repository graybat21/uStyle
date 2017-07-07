package com.ustyle.persistence;

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
	public void updateUsedPoint(Purchase purchase) {
		session.update(namespace + ".updateUsedPoint", purchase);
	}
}