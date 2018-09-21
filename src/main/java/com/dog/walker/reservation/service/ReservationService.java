package com.dog.walker.reservation.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.reservation.dto.ReservationDto;


public interface ReservationService {
	public void check(HttpServletRequest request,ModelAndView mView);
	public void getList(ModelAndView mView, HttpServletRequest request, HttpSession session);
	public void getList2(ModelAndView mView, HttpServletRequest request);
	public void insert(HttpServletRequest request, ModelAndView mView, ReservationDto dto);
	public void isReserved(HttpServletRequest request, int num);
	public void NotReserved(HttpServletRequest request, int num);
	
}
