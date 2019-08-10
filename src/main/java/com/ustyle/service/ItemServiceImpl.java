package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ustyle.domain.Item;
import com.ustyle.persistence.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {

	@Inject
	private ItemDAO dao;

	@Override
	public void insert(Item item) throws Exception {
		dao.insert(item);
	}

	@Override
	public int selectListCnt(HashMap<String, Object> map) throws Exception {
		return dao.selectListCnt(map);
	}
	
	@Override
	public boolean existItem(Item item) throws Exception {
		return dao.existItem(item);
	}

	@Override
	public List<Item> itemList(HashMap<String, Object> map) throws Exception {
		return dao.itemList(map);
	}
	
	@Override
	public List<String> selectColorList(Integer productid) throws Exception {
		return dao.selectColorList(productid);
	}
	
	@Override
	public List<Item> selectedColorItemList(Item selectedColorItem) throws Exception {
		return dao.selectedColorItemList(selectedColorItem);
	}
	
	@Override
	public Item selectedColorSizeItem(Item selectedSizeItem) throws Exception {
		return dao.selectedColorSizeItem(selectedSizeItem);
	}
	
	@Override
	public Item read(Integer itemid) throws Exception {
		return dao.read(itemid);
	}
	
	@Override
	public int totalItem(Integer productid) throws Exception {
		return dao.totalItem(productid);
	}
	
	@Override
	public void update(Item item) throws Exception {
		dao.update(item);
	}
	
	@Override
	public boolean existSalesTable(int itemid) throws Exception {
		return dao.existSalesTable(itemid);
	}

	@Override
	public void deleteItem(int itemid) throws Exception {
		dao.deleteItem(itemid);
	}
}
