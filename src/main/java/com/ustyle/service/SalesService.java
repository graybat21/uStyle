package com.ustyle.service;

import java.util.List;

import com.ustyle.domain.Purchase;
import com.ustyle.domain.Sales;

public interface SalesService {
	public List<Sales> selectUserCartListForPurchase(String username) throws Exception;
	public void insert(Sales sales) throws Exception;
	public void insertPurchase(Purchase purchase) throws Exception;
}
