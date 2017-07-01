package com.ustyle.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ustyle.domain.Grade;

@Repository
public class GradeDAOImpl implements GradeDAO {

	private static String namespace = "com.ustyle.mappers.gradeMapper";

	@Inject
	private SqlSession session;

	@Override
	public List<Grade> selectList() {
		return session.selectList(namespace + ".selectList");
	}

	@Override
	public void insert(Grade grade) {
		session.insert(namespace + ".insert", grade);
	}

	@Override
	public void update(Grade grade) {
		session.update(namespace + ".update", grade);
	}

	@Override
	public void delete(int idx) {
		session.delete(namespace + ".delete", idx);
	}

}
