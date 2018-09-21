package com.dog.walker.search.service;

import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.search.dto.SearchDto;



public interface SearchService {

	public void getAllInfo(String input_address, ModelAndView mView);
	public void findPetWalker(String input_address,ModelAndView mView);
	public void getProfile(String input_address, ModelAndView mView);
	public void getWalkerTotal(String input_address, ModelAndView mView);
	public void getStars(String input_address,ModelAndView mView);
	
}
