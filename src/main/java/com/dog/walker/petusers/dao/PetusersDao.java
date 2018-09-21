package com.dog.walker.petusers.dao;

import com.dog.walker.petusers.dto.PetusersDto;

public interface PetusersDao {
	public void insert(PetusersDto dto);
	public PetusersDto getData(String id);
	public void update(PetusersDto dto);
	public void delete(String id);
	public boolean canUseId(String id);
	public void updatePwd(PetusersDto dto);
	public void updateImg(PetusersDto dto);
	public void isConfirmed(String nickname);
	public void isReviewed(String id);
}
