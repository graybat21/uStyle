package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import com.ustyle.domain.Item;

public interface ItemDAO {
	public void insert(Item item);
	public int selectListCnt(HashMap<String, Object> map);
	public List<Item> itemList(HashMap<String, Object> map);
	public void deleteItem(int itemid);
}
