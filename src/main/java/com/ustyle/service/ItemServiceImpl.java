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

	@Transactional
	@Override
	public List<Item> itemList(HashMap<String, Object> map) throws Exception {
		return dao.itemList(map);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public Item read(Integer itemid) throws Exception {
		return dao.read(itemid);
	}
	
	@Transactional
	@Override
	public void update(Item item) throws Exception {
		dao.update(item);
	}

	@Transactional
	@Override
	public void deleteItem(int itemid) throws Exception {
		dao.deleteItem(itemid);
	}
	
}
