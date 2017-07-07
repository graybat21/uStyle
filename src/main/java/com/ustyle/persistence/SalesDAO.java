package com.ustyle.persistence;

import java.util.List;

import com.ustyle.domain.Purchase;
import com.ustyle.domain.Sales;

public interface SalesDAO {
	public List<Sales> selectUserCartListForPurchase(String username);
	public void insert(Sales sales);
	public void insertPurchase(Purchase purchase);
	public void updateUsedPoint(Purchase purchase);
}
