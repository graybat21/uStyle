package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ustyle.domain.Purchase;
import com.ustyle.domain.Sales;
import com.ustyle.persistence.ItemDAO;
import com.ustyle.persistence.SalesDAO;

@Service
public class SalesServiceImpl implements SalesService {
	
	@Inject
	private SalesDAO salesDao;
	
	@Inject
	private ItemDAO itemDao;
	
	@Override
	public List<Sales> selectUserCartListForPurchase(String username) throws Exception {
		return salesDao.selectUserCartListForPurchase(username);
	}
	
	@Override
	public void insert(Sales sales) throws Exception {
		itemDao.updateForSales(sales);
		salesDao.insert(sales);
	}
	
	@Override
	public void updateAddPoint(HashMap<String, Object> addPointMap) throws Exception {
		salesDao.updateAddPoint(addPointMap);
	}

	@Override
	public void insertPurchase(Purchase purchase) throws Exception {
		salesDao.updateUsedPoint(purchase);
		salesDao.insertPurchase(purchase);
	}
}
