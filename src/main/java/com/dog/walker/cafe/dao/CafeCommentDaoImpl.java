package com.dog.walker.cafe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dog.walker.cafe.dto.CafeCommentDto;
import com.dog.walker.petusers.dto.PetusersDto;
import com.dog.walker.petwalker.dto.PetwalkerDto;

@Repository
public class CafeCommentDaoImpl implements CafeCommentDao{
	@Autowired
	private SqlSession session;

	
	@Override
	public PetwalkerDto getData_users(String writer) {
		PetwalkerDto dto = session.selectOne("petwalker.getData",writer);
		return dto;
	}
	
	@Override
	public PetusersDto getData_petwalker(String writer) {
		PetusersDto dto = session.selectOne("petusers.getData2",writer);
		return dto;
	}
	
	@Override
	public int getSequence() {
		//새로 저장할 댓글의 글번호를 미리 얻어와서 
		int seq=session.selectOne("cafeComment.getSequence");
		//리턴해 주기 
		return seq;
	}

	@Override
	public void insert(CafeCommentDto dto) {
		session.insert("cafeComment.insert", dto);
	}

	
	@Override
	public List<CafeCommentDto> getList(int ref_group) {
		
		return session.selectList("cafeComment.getList", ref_group);
	}
	
}







