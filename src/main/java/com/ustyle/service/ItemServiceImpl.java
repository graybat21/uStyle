package com.ustyle.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.ustyle.domain.Item;
import com.ustyle.persistence.ItemDAO;

@Service
public class ItemServiceImpl implements ItemService {

	@Inject
	private ItemDAO dao;

	@Transactional
	@Override
	public void insert(Item item) throws Exception {
		dao.insert(item);
	}

	@Transactional
	@Override
	public int selectListCnt(HashMap<String, Object> map) throws Exception {
		return dao.selectListCnt(map);
	}
	
	@Override
	public boolean existItem(Item item) throws Exception {
		return dao.existItem(item);
	}

	@Transactional
	@Override
	public List<Item> itemList(HashMap<String, Object> map) throws Exception {
		return dao.itemList(map);
	}
	
	@Transactional
	@Override
	public List<String> selectColorList(Integer productid) throws Exception {
		return dao.selectColorList(productid);
	}
	
	@Transactional
	@Override
	public List<Item> selectedColorItemList(Item selectedColorItem) throws Exception {
		return dao.selectedColorItemList(selectedColorItem);
	}
	
	@Transactional
	@Override
	public Item selectedColorSizeItem(Item selectedSizeItem) throws Exception {
		return dao.selectedColorSizeItem(selectedSizeItem);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public Item read(Integer itemid) throws Exception {
		return dao.read(itemid);
	}
	
	@Override
	public int totalItem(Integer productid) throws Exception {
		return dao.totalItem(productid);
	}
	
	@Transactional
	@Override
	public void update(Item item) throws Exception {
		dao.update(item);
	}
	
	@Override
	public boolean existSalesTable(int itemid) throws Exception {
		return dao.existSalesTable(itemid);
	}

	@Transactional
	@Override
	public void deleteItem(int itemid) throws Exception {
		dao.deleteItem(itemid);
	}
}
