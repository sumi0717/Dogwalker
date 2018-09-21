package com.dog.walker.profile.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.manage.dto.ManageDto;
import com.dog.walker.petwalker.dto.PetwalkerDto;

public interface WalkerProfileService {

	public void check(HttpServletRequest request,ModelAndView mView);
	public void profileupdate(ManageDto dto);
	public void profileupdateForm(ModelAndView mView, HttpSession session);
   public void profileinsert(HttpServletRequest request, ModelAndView mView, ManageDto dto,PetwalkerDto dto2,HttpSession session);
   public void getAndCheckIsProfileValue(HttpServletRequest request, PetwalkerDto dto, ModelAndView mView, HttpSession session);
 //public void checkProfile(HttpServletRequest request, PetwalkerDto dto,ModelAndView mView,HttpSession session) ;
   
}

