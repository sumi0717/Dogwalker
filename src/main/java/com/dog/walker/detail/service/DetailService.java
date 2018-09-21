package com.dog.walker.detail.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.manage.dto.ManageDto;


public interface DetailService {

	public void pwk(HttpServletRequest request, ModelAndView mView);
	public void reviewgetList(HttpServletRequest request,  ModelAndView mView);
	public void rsvInsertform(HttpServletRequest request, ModelAndView mView);

}
