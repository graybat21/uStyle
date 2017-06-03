package com.ustyle.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
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
}
