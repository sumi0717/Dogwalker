package com.dog.walker.petusers.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dog.walker.petusers.dto.PetusersDto;

@Repository
public class PetusersDaoImpl implements PetusersDao {
	
	// 의존객체 DI
	@Autowired
	private SqlSession session;
		
	@Override
	public void insert(PetusersDto dto) {
		session.insert("petusers.insert", dto);
		
	}

	@Override
	public PetusersDto getData(String id) {
		PetusersDto dto=session.selectOne("petusers.getData", id);
		return dto;	
	}

	@Override
	public void update(PetusersDto dto) {
		session.update("petusers.update", dto);
		
	}

	@Override
	public void delete(String id) {
		session.delete("petusers.delete", id);
		
	}

	@Override
	public boolean canUseId(String id) {
		String result=session.selectOne("petusers.isExist", id);
		if(result==null) {// select 된 결과가 없으면 사용가능 
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void updatePwd(PetusersDto dto) {
		session.update("petusers.updatePwd", dto);
		
	}

	@Override
	public void updateImg(PetusersDto dto) {
		session.update("petusers.updateImg", dto);
		
	}

	@Override
	public void isConfirmed(String nickname) {
		session.update("petusers.isConfirmed", nickname);
		
	}

	@Override
	public void isReviewed(String id) {
		session.update("petusers.isReviewed", id);
		
	}
	
	

}
