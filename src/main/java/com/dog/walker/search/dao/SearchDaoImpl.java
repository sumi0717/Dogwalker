package com.dog.walker.search.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dog.walker.search.dto.SearchDto;
import com.dog.walker.search.dto.StarDto;

@Repository
public class SearchDaoImpl implements SearchDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<SearchDto> getList(String input_address) {
		return session.selectList("searchMapper.getList", input_address);
	}
	
	@Override
	public List<StarDto> getStarList(String input_address) {
		return session.selectList("searchMapper.getStarList", input_address);
	}

}
