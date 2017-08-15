package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Item;

public interface ItemService {
	public void insert(Item item) throws Exception;
	public int selectListCnt(HashMap<String, Object> map) throws Exception;
	public List<Item> itemList(HashMap<String, Object> map) throws Exception;
	public List<String> selectColorList(Integer productid) throws Exception;
	public List<Item> selectedColorItemList(Item selectedColorItem) throws Exception;
	public Item selectedColorSizeItem(Item selectedSizeItem) throws Exception;
	public Item read(Integer itemid) throws Exception;
	public int totalItem(Integer productid) throws Exception;
	public void update(Item item) throws Exception;
	public boolean existSalesTable(int itemid) throws Exception;
	public void deleteItem(int itemid) throws Exception;
}