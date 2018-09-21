package com.dog.walker.petusers.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.petusers.dto.PetusersDto;

public interface PetusersService {
	public boolean canUseId(String id);
	public void signup(HttpServletRequest request , ModelAndView mView, PetusersDto dto);
	public void login(ModelAndView mView, PetusersDto dto, HttpSession session);
	public void info(ModelAndView mView, HttpSession session);
	public void updateForm(ModelAndView mView, HttpSession session);
	public void update(PetusersDto dto);
	public boolean isValidPwd(String inputPwd, HttpSession session); 
	public void updatePwd(String pwd, HttpSession session);
	public void updateImg(String pwd, HttpSession session);
	public void delete(ModelAndView mView, HttpSession session);
}
