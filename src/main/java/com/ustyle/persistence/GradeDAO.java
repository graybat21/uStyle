package com.ustyle.persistence;

import java.util.List;

import com.ustyle.domain.Grade;

public interface GradeDAO {

	public List<Grade> selectList();

	public void insert(Grade grade);

	public void update(Grade grade);

	public void delete(int idx);

}
