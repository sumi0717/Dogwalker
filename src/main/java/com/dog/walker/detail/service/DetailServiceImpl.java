package com.dog.walker.detail.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.manage.dao.ManageDao;
import com.dog.walker.manage.dto.ManageDto;
import com.dog.walker.petusers.dto.PetusersDto;
import com.dog.walker.petwalker.dao.PetwalkerDao;
import com.dog.walker.reservation.dao.ReservationDao;
import com.dog.walker.cafe.dto.CafeCommentDto;
import com.dog.walker.cafe.dto.CafeDto;

@Service
public class DetailServiceImpl implements DetailService {
	@Autowired
	private ManageDao dao;
	
	@Autowired
	private ReservationDao rsvdao;
	
	   @Override
	   public void rsvInsertform(HttpServletRequest request, ModelAndView mView) {
	      
	      String id=(String)request.getSession().getAttribute("id");
	      String nickname=request.getParameter("petwalker");
	      mView.addObject("id",id);
	      mView.addObject("nickname",nickname);
	      PetusersDto petUser = rsvdao.pUserGetData(id);
	      request.setAttribute("petUser", petUser);
	      
	   }

	

	@Override
	public void reviewgetList(HttpServletRequest request,  ModelAndView mView) {
		
		String nickname=request.getParameter("nickname");
		mView.addObject("nickname",nickname);
		
		ManageDto dto=new ManageDto();
		
		dto.setNickname(nickname);

		//1. FileDto 객체를 전달해서 파일 목록을 불러온다 
		List<ManageDto> list=dao.rgetList(dto);
		
		//2. request 에 담고
		request.setAttribute("list", list);
	}
	

	@Override
	   public void pwk(HttpServletRequest request, ModelAndView mView) {
	      

	      String nickname=request.getParameter("nickname");
	     
	      
	      ManageDto dto=new ManageDto();
	      
	      dto.setNickname(nickname);
	      
	      ManageDto pwk=dao.pwkGetData(nickname);
	      
	      request.setAttribute("pwk", pwk);
	      
	   }


	
	

}
