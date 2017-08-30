package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Item;
import com.ustyle.domain.Sales;

public interface ItemDAO {
	public void insert(Item item);
	public int selectListCnt(HashMap<String, Object> map);
	public boolean existItem(Item item);
	public List<Item> itemList(HashMap<String, Object> map);
	public List<String> selectColorList(Integer productid);
	public List<Item> selectedColorItemList(Item selectedColorItem);
	public Item selectedColorSizeItem(Item selectedSizeItem);
	public Item read(Integer itemid) throws Exception;
	public int totalItem(Integer productid);
	public void update(Item item);
	public void updateForSales(Sales sales);
	public boolean existSalesTable(int itemid);
	public void deleteItem(int itemid);
}