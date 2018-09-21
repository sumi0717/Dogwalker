package com.dog.walker.detail.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.detail.service.DetailService;
import com.dog.walker.manage.dto.ManageDto;
import com.dog.walker.reservation.dto.ReservationDto;
import com.dog.walker.reservation.service.ReservationService;
import com.dog.walker.review.service.ReviewService;

@Controller
public class DetailController {
	@Autowired
	private DetailService dService;
	
	@Autowired
	private ReviewService rvService;
	
;
	
	
	@RequestMapping("/walkerPrf/detail_main")
	public ModelAndView dMain(HttpServletRequest request ,ModelAndView mView) {
		
		dService.reviewgetList(request, mView);
		dService.pwk(request, mView);
		dService.rsvInsertform(request, mView);
		mView.setViewName("walkerPrf/detail_main");
		
		return mView;
	}
	

	@Autowired
	private ReservationService rService;
	


	@RequestMapping("/walkerPrf/insertform")
	public ModelAndView authinsertform(HttpServletRequest request,ModelAndView mView) {
		rService.check(request,mView);
		dService.rsvInsertform(request, mView);
		dService.pwk(request, mView);
		mView.setViewName("walkerPrf/insertform");
		
   	 	return mView;
	} 
	

	@RequestMapping("/walkerPrf/insert")
	public ModelAndView authReservationInsert(HttpServletRequest request, @ModelAttribute ReservationDto dto) {
		// 서비스에 전달할 ModelAndView 객체 생성
		ModelAndView mView = new ModelAndView();
		rService.insert(request, mView, dto);
		mView.setViewName("walkerPrf/insert");
		return mView;
	}
	
	

	
	
	
	



}
