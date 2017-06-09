package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Item;
import com.ustyle.domain.Product;

public interface ItemDAO {
	public void insert(Item item);
	public int selectListCnt(HashMap<String, Object> map);
	public List<Item> itemList(HashMap<String, Object> map);
	public Item read(Integer itemid) throws Exception;
	public void update(Item item);
	public void deleteItem(int itemid);
}
