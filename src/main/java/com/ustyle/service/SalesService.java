package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Purchase;
import com.ustyle.domain.Sales;

public interface SalesService {
	public List<Sales> selectUserCartListForPurchase(String username) throws Exception;
	public void insert(Sales sales) throws Exception;
	public void updateAddPoint(HashMap<String, Object> addPointMap) throws Exception;
	public void insertPurchase(Purchase purchase) throws Exception;
	public HashMap<String, Object> selectSalesForDaterange(HashMap<String, Object> dateMap) throws Exception;
	public List<HashMap<String, Object>> selectSalesForDaterangeAndPagination(HashMap<String, Object> dateMap) throws Exception;
	public HashMap<String, Object> selectSalesForDate(HashMap<String, Object> userMap) throws Exception;
	public List<HashMap<String, Object>> selectSalesDetail(int purchaseid) throws Exception;
}
