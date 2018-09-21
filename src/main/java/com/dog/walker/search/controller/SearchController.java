package com.dog.walker.search.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.manage.dto.ManageDto;
import com.dog.walker.search.dto.SearchDto;
import com.dog.walker.search.service.SearchService;


@Controller
public class SearchController {

	@Autowired
	private SearchService sService;
	
	
	@RequestMapping("/search/list")
	public ModelAndView allwalkershow(ModelAndView mView, ManageDto profileDto,@RequestParam(defaultValue="") String input_address ) {

		sService.getAllInfo(input_address,mView);
		sService.getWalkerTotal(input_address, mView);
		mView.setViewName("search/allWalker");
		return mView;
	}
	
	
	
	@RequestMapping("/AddressSearchResult")
	public ModelAndView searchForm(ModelAndView mView, ManageDto profileDto,@RequestParam String input_address) {
		
		sService.getAllInfo(input_address,mView);

		sService.getWalkerTotal(input_address, mView);
		//sService.getStars(input_address,mView);
		
		mView.addObject("input_address",input_address);
		mView.setViewName("search/searchWalker");

		return mView;
	}
}

