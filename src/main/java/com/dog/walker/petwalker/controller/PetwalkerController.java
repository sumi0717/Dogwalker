package com.dog.walker.petwalker.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.petwalker.dto.PetwalkerDto;
import com.dog.walker.petwalker.service.PetwalkerService;
import com.dog.walker.reservation.service.ReservationService;

@Controller
public class PetwalkerController {

	@Autowired
	private PetwalkerService pService;

	// 회원가입 요청 처리
	@RequestMapping("/petwalker/signup")
	public ModelAndView signup(HttpServletRequest request, @ModelAttribute PetwalkerDto dto) {
		// 서비스에 전달할 ModelAndView 객체 생성
		ModelAndView mView = new ModelAndView();
		// 서비스에 ModelAndVie 객체와 폼 전송된 회원 가입정보가
		// 담겨있는 UsersDto 객체를 전달한다.
		pService.signup(request, mView, dto);
		// ModelAndView 객체에 view 페이지 정보를 담고
		mView.setViewName("petwalker/signup");
		// 리턴해준다.
		return mView;
	}

	// 회원가입 폼 요청 처리
	@RequestMapping("/petwalker/signup_form")
	public String signupForm() {
		return "petwalker/signup_form";
	}

	@RequestMapping("/petwalker/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId) {
		// 서비스 객체를 이용해서 사용가능 여부를 boolean type
		// 으로 리턴 받는다.
		boolean canUse = pService.canUseId(inputId);
		// Map 에 담는다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("canUse", canUse);
		// {"canUse":true} or {"canUse":false}
		return map;
	}

	// 로그인 폼 요청 처리
	@RequestMapping("/petwalker/loginform")
	public String loginForm(HttpServletRequest request) {
		// 로그인 후 이동할 url 주소를 읽어온다.
		String url = request.getParameter("url");
		// 만일 전달되지 않았으면
		if (url == null) {
			// 인덱스로 이동할수 있도록
			url = request.getContextPath() + "/";
		}
		// request 에 담기
		request.setAttribute("url", url);

		return "petwalker/loginform";
	}

	public ModelAndView loginForm2(@RequestParam(defaultValue = "") String url, HttpServletRequest request) {

		// 만일 전달되지 않았으면
		if (url.equals("")) {
			// 인덱스로 이동할수 있도록
			url = request.getContextPath() + "/";
		}
		ModelAndView mView = new ModelAndView();
		mView.addObject("url", url);
		mView.setViewName("petwalker/loginform");

		return mView;
	}

	// 로그인 요청 처리
	@RequestMapping("/petwalker/login")
	public ModelAndView login(@ModelAttribute PetwalkerDto dto, @RequestParam String url, HttpSession session) {
		ModelAndView mView = new ModelAndView();
		// 서비스를 통해서 로그인 처리를 한다.
		pService.login(mView, dto, session);

		// 로그인후 이동할 url
		mView.addObject("url", url);
		// view 페이지 정보
		mView.setViewName("petwalker/login");
		return mView;
	}

	// 로그아웃 요청 처리
	@RequestMapping("/petwalker/logout")
	public String logout(HttpSession session) {
		// 세션 초기화
		session.invalidate();
		// view 페이지 정보 리턴
		return "petwalker/logout";
	}
	// 개인 정보 보기 요청 처리

	@Autowired
	private ReservationService rService;

	// 리절브예약 수락
	@RequestMapping("/petwalker/reserved")
	public ModelAndView Reserved(@RequestParam int num, HttpServletRequest request, ModelAndView mView) {
		rService.isReserved(request, num);

		return new ModelAndView("redirect:/petwalker/reservation.do");

	}

	// 리절브 예약거부
	@RequestMapping("/petwalker/notReserved")
	public ModelAndView notReserved(HttpServletRequest request, @RequestParam int num) {
		rService.NotReserved(request, num);
		return new ModelAndView("redirect:/petwalker/reservation.do");
	}
	
	@RequestMapping("/petwalker/reservation")
	public ModelAndView Reservation(HttpServletRequest request, ModelAndView mView, HttpSession session) {

		// rService.isReserved(request, mView, nickname);

		rService.getList(mView, request, session);
		mView.setViewName("petwalker/reservation");

		return mView;

	}

	@RequestMapping("/petwalker/info")
	public ModelAndView authInfo(HttpServletRequest request, HttpSession session) {

		ModelAndView mView = new ModelAndView();

		pService.info(mView, session);

		// view 페이지의 정보를 담아서
		mView.setViewName("petwalker/info");
		// ModelAndView 객체를 리턴해 준다.

		return mView;
	}

	// 회원 가입 정보 수정폼 요청 처리
	@RequestMapping("/petwalker/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request, HttpSession session) {
		// ModelAndView 객체를 생성해서
		ModelAndView mView = new ModelAndView();
		// 서비스에 인자로 전달해서 회원정보가 담기게 하고
		pService.updateForm(mView, session);
		// view 페이지에서 회원 정보 수정 폼을 출력한다.
		mView.setViewName("petwalker/updateform");
		return mView;
	}

	// 회원 정보 수정 요청 처리
	@RequestMapping("/petwalker/update")
	public ModelAndView authUpdate(HttpServletRequest request, @ModelAttribute PetwalkerDto dto) {
		pService.update(request, dto);

		return new ModelAndView("redirect:/petwalker/info.do");
	}

	@RequestMapping("/petwalker/pw_changeform")
	public ModelAndView authPwUpdateForm(HttpServletRequest request) {

		return new ModelAndView("petwalker/pw_changeform");
	}

	@RequestMapping("/petwalker/pw_check")
	@ResponseBody
	public Map<String, Object> pwCheck(@RequestParam String inputPwd, HttpSession session) {
		boolean isValid = pService.isValidPwd(inputPwd, session);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isValid", isValid);
		// {"isValid":true} or {"isValid":false}
		return map;
	}

	// 비밀번호 수정 반영하는 요청 처리
	@RequestMapping("/petwalker/pw_update")
	public ModelAndView authPwUpdate(HttpServletRequest request, @RequestParam String pwd, HttpSession session) {
		// 서비스를 이용해서 비밀번호 수정
		pService.updatePwd(pwd, session);
		// 개인정보 보기로 리다일렉트
		return new ModelAndView("redirect:/petwalker/info.do");
	}

	// 회원 탈퇴 요청 처리
	@RequestMapping("/petwalker/delete")
	public ModelAndView authDelete(HttpServletRequest request, ModelAndView mView) {
		// 서비스를 통해서 회원 탈퇴 처리를 하고
		pService.delete(mView, request.getSession());
		// view 페이지로 이동해서 응답하기
		mView.setViewName("petwalker/delete");
		return mView;
	}

}