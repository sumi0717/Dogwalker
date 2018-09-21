package com.dog.walker.search.dao;

import java.util.List;

import com.dog.walker.search.dto.SearchDto;
import com.dog.walker.search.dto.StarDto;

public interface SearchDao {
	
	public List<SearchDto> getList(String input_address);
	public List<StarDto> getStarList(String input_address);
}
