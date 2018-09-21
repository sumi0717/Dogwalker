package com.dog.walker.petwalker.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.petwalker.dto.PetwalkerDto;

public interface PetwalkerService {
	public boolean canUseId(String id);
	public void signup(HttpServletRequest request,ModelAndView mView, PetwalkerDto dto);
	public void login(ModelAndView mView, PetwalkerDto dto, HttpSession session);
	public void info(ModelAndView mView, HttpSession session);
	public void updateForm(ModelAndView mView, HttpSession session);
	public void update(HttpServletRequest request ,PetwalkerDto dto);
	public boolean isValidPwd(String inputPwd, HttpSession session);
	public void updatePwd(String pwd, HttpSession session);
	public void updateImg(String pwd, HttpSession session);
	public void delete(ModelAndView mView, HttpSession session);

	
}
