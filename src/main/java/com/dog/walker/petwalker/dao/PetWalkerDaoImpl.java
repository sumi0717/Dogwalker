package com.dog.walker.petwalker.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dog.walker.petwalker.dto.PetwalkerDto;

@Repository
public class PetWalkerDaoImpl implements PetwalkerDao {
	// 의존객체 DI
	@Autowired
	private SqlSession session;
	
	//펫워커 회원정보를 추가하는 메소드
	@Override
	public void insert(PetwalkerDto dto) {
		session.insert("petwalker.insert", dto);
	}
	
	//펫워커 회원 한 명의 정보를 id로 select해서 리턴하는 메소드
	@Override
	public PetwalkerDto getData(String id) {
		PetwalkerDto dto=session.selectOne("petwalker.getData", id);
		return dto;	
	}
	
	
	
	//회원 한명의 정보를 수정하는 메소드
	@Override
	public void update(PetwalkerDto dto) {
		session.update("petwalker.update", dto);

	}
	
	//회원 한명의 정보를 삭제하는 메소드 
	@Override
	public void delete(String id) {
		session.delete("petwalker.delete", id);

	}
	
	//사용할수 있는 아이디 인지 여부를 리턴하는 메소드 
	@Override
	public boolean canUseId(String id) {
		String result=session.selectOne("petwalker.isExist", id);
		if(result==null) {// select 된 결과가 없으면 사용가능 
			return true;
		}else {
			return false;
		}
	}
	
	//비밀번호 수정하는 메소드
	@Override
	public void updatePwd(PetwalkerDto dto) {
		session.update("petwalker.updatePwd", dto);

	}
	
	//이미지 수정하는 메소드
	@Override
	public void updateImg(PetwalkerDto dto) {
		session.update("petwalker.updateImg", dto);

	}

	@Override
	public List<PetwalkerDto> getList(String id) {
		List<PetwalkerDto> list = session.selectList("petwalker.getList",id);
		return list;
	}

	
	@Override
	public int getCount(String id) {
		int num = session.selectOne("petwalker.getCount",id); 
		return num;
	}
	
	@Override
	public List<PetwalkerDto> getnicknameList() {
	      List<PetwalkerDto> list = session.selectList("petwalker.getidandnicnameList");
	      return list;
	}
	
	@Override
	public void updateProfile(String id) {
		session.update("petwalker.updateProfile",id);
	}
	
	
	@Override
	public PetwalkerDto getProfile(String id) {
		PetwalkerDto dto=session.selectOne("petwalker.getData", id);
		return dto;
	}
	
	
	
}
