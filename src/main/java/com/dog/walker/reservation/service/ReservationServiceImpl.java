package com.dog.walker.reservation.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.manage.dao.ManageDao;
import com.dog.walker.manage.dto.ManageDto;
import com.dog.walker.petusers.dao.PetusersDao;
import com.dog.walker.petwalker.dao.PetwalkerDao;
import com.dog.walker.petwalker.dto.PetwalkerDto;
import com.dog.walker.reservation.dao.ReservationDao;
import com.dog.walker.reservation.dto.ReservationDto;
import com.dog.walker.cafe.dto.CafeCommentDto;
import com.dog.walker.cafe.dto.CafeDto;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao dao;
	
	@Autowired
	private PetusersDao pudao;

	@Override
	public void getList(ModelAndView mView, HttpServletRequest request, HttpSession session) {
		

		String id=(String)session.getAttribute("id");
		
		ReservationDto dto= new ReservationDto();
		
		dto.setId(id);
		


		//1. FileDto 객체를 전달해서 파일 목록을 불러온다 
		List<ReservationDto> list=dao.reservationgetList(dto);
		
		//2. request 에 담고
		request.setAttribute("list", list);
		
	}
	
	
	@Override
	public void getList2(ModelAndView mView, HttpServletRequest request) {
		
		String nickname=request.getParameter("nickname");
		mView.addObject("nickname",nickname);
		
		ReservationDto dto= new ReservationDto();
		
		dto.setNickname(nickname);

		//1. FileDto 객체를 전달해서 파일 목록을 불러온다 
		List<ReservationDto> list=dao.reservationgetList2(dto);
		
		//2. request 에 담고
		request.setAttribute("list", list);
		
	}
	
	

	@Override
	public void insert(HttpServletRequest request, ModelAndView mView, ReservationDto dto) {

		
		
		String petwalker=request.getParameter("petwalker");
		String kakao=request.getParameter("kakao");
		String nickname=request.getParameter("nickname");
		
		mView.addObject("petwalker",petwalker);
		mView.addObject("kakao", kakao);
		mView.addObject("nickname", nickname);

		
		dto.setPetwalker(petwalker);
		dto.setKakao(kakao);
		dto.setNickname(nickname);
		
		dao.insert(dto);
	}
	
	@Override
	public void check(HttpServletRequest request,ModelAndView mView) {
		String petwalker=request.getParameter("petwalker");
		mView.addObject("petwalker",petwalker);


	}


	@Override
	public void isReserved(HttpServletRequest request, int num) {
		
		num = Integer.parseInt(request.getParameter("num"));
		String nickname= request.getParameter("nickname");
		System.out.println("받은 닉네임은:"+nickname);
		dao.rsvConfirm(num);
		pudao.isConfirmed(nickname);	
	}


	@Override
	public void NotReserved(HttpServletRequest request, int num) {
		num = Integer.parseInt(request.getParameter("num"));
		dao.rsvConfirmX(num);
		
		
	}



}
