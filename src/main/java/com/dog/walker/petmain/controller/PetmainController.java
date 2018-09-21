package com.dog.walker.petmain.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PetmainController {
	// 로그인 두 가지 경우
	@RequestMapping("/home_login")
	public ModelAndView petLogin(HttpServletRequest request, ModelAndView mView) {
		mView.setViewName("home_login");
		return mView;
	}

	// 회원가입 두 가지 경우
	@RequestMapping("/home_signup")
	public ModelAndView petSignup(HttpServletRequest request, ModelAndView mView) {
		mView.setViewName("home_signup");
		return mView;
	}
}
