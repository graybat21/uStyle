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

	@Override
	public HashMap<String, Object> selectSalesForDaterange(HashMap<String, Object> dateMap) throws Exception {
		return salesDao.selectSalesForDaterange(dateMap);
	}

	@Override
	public List<HashMap<String, Object>> selectSalesForDaterangeAndPagination(HashMap<String, Object> dateMap) throws Exception {
		return salesDao.selectSalesForDaterangeAndPagination(dateMap);
	}
	
	@Override
	public HashMap<String, Object> selectSalesForDate(HashMap<String, Object> userMap) throws Exception {
		return salesDao.selectSalesForDate(userMap);
	}

	@Override
	public List<HashMap<String, Object>> selectSalesDetail(int purchaseid) throws Exception {
		return salesDao.selectSalesDetail(purchaseid);
	}
}
