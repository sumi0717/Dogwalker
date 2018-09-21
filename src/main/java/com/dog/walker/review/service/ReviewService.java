package com.dog.walker.review.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.manage.dto.ManageDto;




public interface ReviewService {
	public void upload(HttpServletRequest request, ModelAndView mView, ManageDto dto);
	
	public void reviewgetList(HttpServletRequest request,HttpSession session);
	public void reviewpetwalkergetList(HttpServletRequest request);
}
