package com.ustyle.domain;

public class Grade {

//	private Integer idx;
//	private String grade;
//	private String point_ratio;
//	private Integer buy_term;
//	private Integer min;
//	private Integer max;
	
	private int idx;
	private String grade;
	private double point_ratio;
	private int buy_term;
	private int min;
	private int max;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getBuy_term() {
		return buy_term;
	}
	public void setBuy_term(int buy_term) {
		this.buy_term = buy_term;
	}
	public int getMin() {
		return min;
	}
	public void setMin(int min) {
		this.min = min;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public double getPoint_ratio() {
		return point_ratio;
	}
	public void setPoint_ratio(double point_ratio) {
		this.point_ratio = point_ratio;
	}

	@Override
	public String toString() {
		return "Grade [idx=" + idx + ", grade=" + grade + ", point_ratio=" + point_ratio + ", buy_term=" + buy_term
				+ ", min=" + min + ", max=" + max + "]";
	}
}
