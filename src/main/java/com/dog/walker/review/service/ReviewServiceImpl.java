package com.dog.walker.review.service;

import java.io.File;
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
import com.dog.walker.petusers.dto.PetusersDto;
import com.dog.walker.petwalker.dao.PetwalkerDao;
import com.dog.walker.petwalker.dto.PetwalkerDto;


@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ManageDao dao;
	
	@Autowired
	private PetwalkerDao pdao;
	
	@Autowired
	private PetusersDao pudao;

	@Override
	public void upload(HttpServletRequest request, ModelAndView mView, ManageDto dto) {
		 
	      //파일을 저장할 폴더의 절대 경로를 얻어온다.
	      String realPath=request.getSession()
	            .getServletContext().getRealPath("/upload");
	      //콘솔에 경로 출력해보기
	      
	      //MultipartFile 객체의 참조값 얻어오기
	      //FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
	      MultipartFile mFile=dto.getFile();
	      //원본 파일명
	      String orgFileName=mFile.getOriginalFilename();
	      //파일 사이즈
	      long imageSize=mFile.getSize();
	      //저장할 파일의 상세 경로
	      String filePath=realPath+File.separator;
	      //디렉토리를 만들 파일 객체 생성
	      File file=new File(filePath);
	      if(!file.exists()){//디렉토리가 존재하지 않는다면
	         file.mkdir();//디렉토리를 만든다.
	      }
	      //파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
	      String saveFileName=System.currentTimeMillis()+orgFileName;
	      try{
	         //upload 폴더에 파일을 저장한다.
	         mFile.transferTo(new File(filePath+saveFileName));
	      }catch(Exception e){
	         e.printStackTrace();
	      }
	      
	      //FileDto 객체에 추가 정보를 담는다.

	      int stars = Integer.parseInt(request.getParameter("stars"));
	      dto.setStars(stars);
	      dto.setOrgImageName(orgFileName);
	      dto.setSaveImageName(saveFileName);
	      dto.setImageSize(imageSize);
	      dto.setImagePath("/upload/"+saveFileName);

	      //세션에서 작성자 정보를 얻어온다.
		  String id=(String)request.getSession().getAttribute("id"); // 작성자는 세션에서 얻어서
		  //FileDto 객체에 작성자 정보를 담는다.
		  dto.setWriter(id); // DB 에 저장
			
		  //FileDao 객체를 이용해서 DB 에 저장하기
		  dao.insert(dto);
		  
		  pudao.isReviewed(id);
		  
		 
		  
	}
	
	//한 페이지에 나타낼 로우의 갯수
	private static final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	private static final int PAGE_DISPLAY_COUNT=3;	

	@Override
	public void reviewgetList(HttpServletRequest request,HttpSession session) {
		
		ManageDto dto=new ManageDto();
		//보여줄 페이지의 번호
		int pageNum=1;
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어온다.
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
			//페이지 번호를 설정한다.
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		int totalRow=dao.getCount(dto);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		// 위에서 만든 CafeDto 에 추가 정보를 담는다. 
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		//1. FileDto 객체를 전달해서 파일 목록을 불러온다 
		List<ManageDto> list=dao.reviewgetList(dto);
		
		//2. request 에 담고
		request.setAttribute("list", list);
		// 페이징 처리에 관련된 값도 request 에 담기 
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		// 전체 row 의 갯수도 전달하기
		request.setAttribute("totalRow", totalRow);	
		
		
		String id=(String)request.getSession().getAttribute("id");
		
		//boolean isWalker = (boolean)request.getSession().getAttribute("isWalker");
		//boolean isWalker = (boolean)session.getAttribute("isWalker");
		boolean isWalker=false;
		
		if(session.getAttribute("isWalker") != null) {
			isWalker=(boolean)session.getAttribute("isWalker");
		}
		if(id != null && isWalker == false) {
			System.out.println("들어옴?");
			PetusersDto user_dto = pudao.getData(id);
		
			int canWrite= user_dto.getIsConfirmed(); 
			//세션에서 가져온 아이디로 정보 찾아서 isconfirmed 된 숫자를 찾아서 그게 0이상이면
			//일단 getisConfirmed 게터 세터도 만들어줘서 가져온것.
			//upload에서 isReviewed로 0되면 업로드 못하게 막고.
			
			request.setAttribute("canWrite", canWrite);
		}
	}

	@Override
	   public void reviewpetwalkergetList(HttpServletRequest request) {
	      // TODO Auto-generated method stub
	      
	      
	      List<PetwalkerDto> list = pdao.getnicknameList();
	      
	      request.setAttribute("list", list);

	   }

	

}
