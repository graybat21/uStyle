package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Item;
import com.ustyle.domain.Product;

public interface ItemService {
	public void insert(Item item) throws Exception;

	public int selectListCnt(HashMap<String, Object> map) throws Exception;

	public List<Item> itemList(HashMap<String, Object> map) throws Exception;
	
	public Item read(Integer itemid) throws Exception;
	
	public void update(Item item) throws Exception;

	public void deleteItem(int itemid) throws Exception;
}