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
	public void deleteItem(int itemid) {
		session.delete(namespace + ".deleteItem", itemid);
	}

}
