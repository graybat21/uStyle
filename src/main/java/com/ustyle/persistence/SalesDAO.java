package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Purchase;
import com.ustyle.domain.Sales;

public interface SalesDAO {
	public List<Sales> selectUserCartListForPurchase(String username);
	public void insert(Sales sales);
	public void insertPurchase(Purchase purchase);
	public void updateAddPoint(HashMap<String, Object> addPointMap);
	public void updateUsedPoint(Purchase purchase);
	public HashMap<String, Object> selectSalesForDaterange(HashMap<String, Object> dateMap);
	public List<HashMap<String, Object>> selectSalesForDaterangeAndPagination(HashMap<String, Object> dateMap);
	public HashMap<String, Object> selectSalesForDate(HashMap<String, Object> userMap);
	public List<HashMap<String, Object>> selectSalesDetail(int purchaseid);
}
