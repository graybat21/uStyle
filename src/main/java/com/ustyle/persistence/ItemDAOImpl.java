package com.ustyle.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Item;

@Repository
public class ItemDAOImpl implements ItemDAO {

	private static String namespace = "com.ustyle.mappers.itemMapper";

	@Inject
	private SqlSession session;

	@Override
	public void insert(Item item) {
		session.insert(namespace + ".insert", item);
	}

	@Override
	public int selectListCnt(HashMap<String, Object> map) {
		return session.selectOne(namespace + ".selectListCnt", map);
	}

	@Override
	public List<Item> itemList(HashMap<String, Object> map) {
		return session.selectList(namespace + ".itemList", map);
	}
	
	@Override
	public List<String> selectColorList(Integer productid) {
		return session.selectList(namespace + ".selectColorList", productid);
	}
	
	@Override
	public List<Item> selectedColorItemList(Item selectedColorItem) {
		return session.selectList(namespace + ".selectedColorItemList", selectedColorItem);
	}
	
	@Override
	public Item selectedColorSizeItem(Item selectedSizeItem) {
		return session.selectOne(namespace + ".selectedColorSizeItem", selectedSizeItem);
	}
	
	@Override
	public Item read(Integer itemid) throws Exception {
		return session.selectOne(namespace + ".read", itemid);
	}
	
	@Override
	public int totalItem(Integer productid) {
		return session.selectOne(namespace + ".totalItem", productid);
	}
	
	@Override
	public void update(Item item) {
		session.update(namespace + ".update", item);
	}
	
	@Override
	public void deleteItem(int itemid) {
		session.delete(namespace + ".deleteItem", itemid);
	}
}
