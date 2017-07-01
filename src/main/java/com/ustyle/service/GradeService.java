package com.ustyle.service;

import java.util.List;

import com.ustyle.domain.Grade;

public interface GradeService {
	public List<Grade> selectList() throws Exception;

	public void insert(Grade grade) throws Exception;

	public void update(Grade grade) throws Exception;

	public void delete(int idx) throws Exception;
}
