package com.ustyle.persistence;

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
}
