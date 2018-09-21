package com.dog.walker.petwalker.dao;

import java.util.List;

import com.dog.walker.petwalker.dto.PetwalkerDto;

public interface PetwalkerDao {
	public void insert(PetwalkerDto dto);
	public PetwalkerDto getData(String id);
	public List<PetwalkerDto> getList(String id);
	public void update(PetwalkerDto dto);
	public void delete(String id);
	public boolean canUseId(String id);
	public void updatePwd(PetwalkerDto dto);
	public void updateImg(PetwalkerDto dto);
	public int getCount(String id);
	public List<PetwalkerDto> getnicknameList(); 

	public void updateProfile(String id);
	public PetwalkerDto getProfile(String id); 
}
