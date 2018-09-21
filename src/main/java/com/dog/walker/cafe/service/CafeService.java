package com.dog.walker.cafe.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.cafe.dto.CafeCommentDto;

public interface CafeService {
	public void getList(HttpServletRequest request);
	public void insert(HttpServletRequest request);
	public void detail(HttpServletRequest request);
	public void commentInsert(CafeCommentDto dto,HttpSession session);
	public void delete(HttpServletRequest request);
	public void update(HttpServletRequest request);
}













