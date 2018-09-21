package com.dog.walker.petusers.controller;

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

import com.dog.walker.petusers.dto.PetusersDto;
import com.dog.walker.petusers.service.PetusersService;
import com.dog.walker.reservation.service.ReservationService;

@Controller
public class PetusersController {

   @Autowired
   private PetusersService uService;

    // 회원가입 요청 처리
      @RequestMapping("/petusers/signup")
      public ModelAndView signup(HttpServletRequest request, @ModelAttribute PetusersDto dto) {
         // 서비스에 전달할 ModelAndView 객체 생성
         ModelAndView mView = new ModelAndView();
         // 서비스에 ModelAndVie 객체와 폼 전송된 회원 가입정보가
         // 담겨있는 UsersDto 객체를 전달한다.
         uService.signup(request,mView, dto);
         // ModelAndView 객체에 view 페이지 정보를 담고
         mView.setViewName("petusers/signup");
         // 리턴해준다.
         return mView;
      }

   // 회원가입 폼 요청 처리
   @RequestMapping("/petusers/signup_form")
   public String signupForm() {
      return "petusers/signup_form";
   }

   @RequestMapping("/petusers/checkid")
   @ResponseBody
   public Map<String, Object> checkid(@RequestParam String inputId) {
      // 서비스 객체를 이용해서 사용가능 여부를 boolean type
      // 으로 리턴 받는다.
      boolean canUse = uService.canUseId(inputId);
      // Map 에 담는다.
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("canUse", canUse);
      // {"canUse":true} or {"canUse":false}
      return map;
   }

   // 로그인 폼 요청 처리
   @RequestMapping("/petusers/loginform")
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

      return "petusers/loginform";
   }

   public ModelAndView loginForm2(@RequestParam(defaultValue = "") String url, HttpServletRequest request) {

      // 만일 전달되지 않았으면
      if (url.equals("")) {
         // 인덱스로 이동할수 있도록
         url = request.getContextPath() + "/";
      }
      ModelAndView mView = new ModelAndView();
      mView.addObject("url", url);
      mView.setViewName("petusers/loginform");

      return mView;
   }
   
   //로그인 요청 처리
      @RequestMapping("/petusers/login")
      public ModelAndView login(@ModelAttribute PetusersDto dto,
            @RequestParam String url, HttpSession session) {
         ModelAndView mView=new ModelAndView();
         //서비스를 통해서 로그인 처리를 한다.
         uService.login(mView, dto, session);
         
         //로그인후 이동할 url
         mView.addObject("url", url);
         //view 페이지 정보
         
         mView.setViewName("petusers/login");
         return mView;
      }
   //로그아웃 요청 처리
      @RequestMapping("/petusers/logout")
      public String logout(HttpSession session) {
         //세션 초기화 
         session.invalidate();
         //view 페이지 정보 리턴 
         return "petusers/logout";
      }
      
   //개인 정보 보기 요청 처리
      @RequestMapping("/petusers/info")
      public ModelAndView authInfo(HttpServletRequest request, HttpSession session) {
         ModelAndView mView=new ModelAndView();

			uService.info(mView, session);
			
			//view 페이지의 정보를 담아서 
			mView.setViewName("petusers/info");
			//ModelAndView 객체를 리턴해 준다. 
			return mView;
		}
		
		@Autowired
		private ReservationService rService;
		
		//펫 유저 예약테이블
		@RequestMapping("/petusers/reservation")
		public ModelAndView Reservation(HttpServletRequest request, ModelAndView mView) {
			
			
			
			rService.getList2(mView, request);
			mView.setViewName("petusers/reservation");
			
			return mView;
			
			
		}
		//회원 가입 정보 수정폼 요청 처리
		@RequestMapping("/petusers/updateform")
		public ModelAndView authUpdateForm(HttpServletRequest request,
				HttpSession session) {
			//ModelAndView 객체를 생성해서 
			ModelAndView mView=new ModelAndView();
			//서비스에 인자로 전달해서 회원정보가 담기게 하고 
			uService.updateForm(mView, session);
			//view 페이지에서 회원 정보 수정 폼을 출력한다.
			mView.setViewName("petusers/updateform");
			return mView;
		}
		//회원 정보 수정 요청 처리
		@RequestMapping("/petusers/update")
		public ModelAndView authUpdate(HttpServletRequest request,
				@ModelAttribute PetusersDto dto) {
			uService.update(dto);
			//개인 정보 보기 페이지로 리다일렉트 이동 
			return new ModelAndView("redirect:/petusers/info.do");
		}
		@RequestMapping("/petusers/pw_changeform")
		public ModelAndView authPwUpdateForm(HttpServletRequest request) {
			
			return new ModelAndView("petusers/pw_changeform");
		}
		@RequestMapping("/petusers/pw_check")
		@ResponseBody
		public Map<String, Object> pwCheck(@RequestParam String inputPwd,
				HttpSession session){
			boolean isValid=uService.isValidPwd(inputPwd, session);
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("isValid", isValid);
			// {"isValid":true} or {"isValid":false} 
			return map;
		}
		//비밀번호 수정 반영하는 요청 처리
		@RequestMapping("/users/pw_update")
		public ModelAndView authPwUpdate(HttpServletRequest request,
				@RequestParam String pwd, HttpSession session) {
			//서비스를 이용해서 비밀번호 수정 
			uService.updatePwd(pwd, session);
			//개인정보 보기로 리다일렉트 
			return new ModelAndView("redirect:/petusers/info.do");
		}
		
		//회원 탈퇴 요청 처리
		@RequestMapping("/petusers/delete")
		public ModelAndView authDelete(HttpServletRequest request,
				ModelAndView mView) {
			//서비스를 통해서 회원 탈퇴 처리를 하고 
			uService.delete(mView, request.getSession());
			//view 페이지로 이동해서 응답하기
			mView.setViewName("petusers/delete");
			return mView;
		}
}

