package com.dog.walker.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.manage.dto.ManageDto;
import com.dog.walker.petwalker.dto.PetwalkerDto;

import com.dog.walker.review.service.ReviewService;



@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;

	
	@RequestMapping("/review/list")
	public ModelAndView list(HttpServletRequest request,HttpSession session) {
		//인자로 전달받은 HttpServletRequest 객체를 서비스에 전달해서
		//비즈니스 로직을 수행하고 
		//view 페이지에서 필요한 데이터가 request 영역에 담기게 한다.
		rService.reviewgetList(request,session);
		//view 페이지로 forward 이동
		return new ModelAndView("review/list");
	}
	
	@RequestMapping("/review/uploadform")
	public ModelAndView authReviewUploadform(HttpServletRequest request) {
	      
	      rService.reviewpetwalkergetList(request);
	      
	      return new ModelAndView("review/uploadform");
	}
	
	@RequestMapping("/review/upload")
	public ModelAndView ReviewUpload(HttpServletRequest request, @ModelAttribute ManageDto dto) {
		// 서비스에 전달할 ModelAndView 객체 생성
		ModelAndView mView = new ModelAndView();
		// 서비스에 ModelAndVie 객체와 폼 전송된 회원 가입정보가
		// 담겨있는 UsersDto 객체를 전달한다.
		rService.upload(request, mView, dto);
		// ModelAndView 객체에 view 페이지 정보를 담고
		// 리턴해준다.
		return new ModelAndView("redirect:/review/list.do");
	}
	
}
