package com.dog.walker.reservation.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.reservation.dto.ReservationDto;
import com.dog.walker.reservation.service.ReservationService;

public class ReservationController {

	@Autowired
	private ReservationService rService;
	

	@RequestMapping("/walkerPrf/insertform")
	public ModelAndView insertform(HttpServletRequest request) {
		return new ModelAndView("walkerPrf/insertform");
	} 
	

	@RequestMapping("/walkerPrf/insert")
	public ModelAndView ReservationInsert(HttpServletRequest request, @ModelAttribute ReservationDto dto) {
		// 서비스에 전달할 ModelAndView 객체 생성
		ModelAndView mView = new ModelAndView();
		rService.insert(request, mView, dto);
		return new ModelAndView("redirect:/walkerPrf/insert");
	}
	

	
	
	
}
