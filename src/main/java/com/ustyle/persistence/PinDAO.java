package com.ustyle.persistence;

import java.util.List;

import com.ustyle.domain.Pin;

public interface PinDAO {

	public void insertPin(Pin pin);

	public List<Pin> getPins(int pinboardno);
	
	public void deletePin(int pinno);
	
	public void deleteAllPin(int pinboardno);
}
