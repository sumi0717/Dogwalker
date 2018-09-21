package com.dog.walker.profile.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.manage.dao.ManageDao;
import com.dog.walker.manage.dto.ManageDto;
import com.dog.walker.petwalker.dao.PetwalkerDao;
import com.dog.walker.petwalker.dto.PetwalkerDto;

@Service
public class WalkerProfileServiceImpl implements WalkerProfileService{
	@Autowired
	private ManageDao dao;
   @Autowired
   private PetwalkerDao wdao;

	@Override
	public void profileupdate(ManageDto dto) {
		dao.profileupdate(dto);
		
	}
	@Override
	public void profileupdateForm(ModelAndView mView, HttpSession session) {
		String id=(String)session.getAttribute("id");
		ManageDto dto=dao.getData2(id);
		mView.addObject("dto", dto);
		
	}
	@Override
	public void check(HttpServletRequest request,ModelAndView mView) {
	String nickname=request.getParameter("nickname");
	 mView.addObject("nickname",nickname);
		
	}


   @Override
   public void profileinsert(HttpServletRequest request, ModelAndView mView, ManageDto dto,PetwalkerDto dto2,HttpSession session) {
      
	  String id= (String) session.getAttribute("id");	   	
	  
	  System.out.println(id); 
	  
      //파일을 저장할 폴더의 절대 경로를 얻어온다.
      String realPath=request.getSession()
              .getServletContext().getRealPath("/upload");
      //콘솔에 경로 출력해보기
      //MultipartFile 객체의 참조값 얻어오기
      //FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
      MultipartFile mFile=dto.getFile1();
      //원본 파일명
      String orgFileName=mFile.getOriginalFilename();
      //파일 사이즈
        long fileSize=mFile.getSize();
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
        dto.setOrgFileName(orgFileName);
        dto.setSaveFileName(saveFileName);
        dto.setFileSize(fileSize);
        dto.setFilePath("/upload/"+saveFileName);
     
        dao.profileinsert(dto);
        
        wdao.updateProfile(id);
      
   }

	@Override
	public void getAndCheckIsProfileValue(HttpServletRequest request, PetwalkerDto dto,ModelAndView mView,HttpSession session) {
		// TODO Auto-generated method stub
		String id=(String)session.getAttribute("id");
		
		dto = wdao.getProfile(id);//id에 맞는 petWalkerdto 를 가져온다.
		mView.addObject("dto",dto);
		System.out.println(id);
		System.out.println(dto);
		
		//id에 맞는게 
		//wdao.checkProfile(id);
	}

}