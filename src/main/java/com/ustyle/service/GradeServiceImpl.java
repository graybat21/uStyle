package com.ustyle.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ustyle.domain.Grade;
import com.ustyle.persistence.GradeDAO;

@Service
public class GradeServiceImpl implements GradeService {

	@Inject
	private GradeDAO dao;

	@Override
	public List<Grade> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public void insert(Grade grade) throws Exception {
		dao.insert(grade);
	}

	@Override
	public void update(Grade grade) throws Exception {
		dao.update(grade);
	}

	@Override
	public void delete(int idx) throws Exception {
		dao.delete(idx);
	}

}
