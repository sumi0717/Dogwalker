package com.dog.walker.petwalker.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dog.walker.petwalker.dao.PetwalkerDao;
import com.dog.walker.petwalker.dto.PetwalkerDto;

@Service
public class PetwalkerServiceImpl implements PetwalkerService {
	// 의존객체 DI
	@Autowired
	private PetwalkerDao dao;

	@Override
	public boolean canUseId(String id) {
		// 인자로 전달된 아이디의 사용가능 여부를 리턴해 준다.
		return dao.canUseId(id);
	}

	@Override
	public void signup(HttpServletRequest request, ModelAndView mView, PetwalkerDto dto) {
		// 파일을 저장할 폴더의 절대 경로를 얻어온다.
		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		// 콘솔에 경로 출력해보기

		// MultipartFile 객체의 참조값 얻어오기
		// PetwalkerDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
		MultipartFile mFile = dto.getFile();
		// 원본 파일명
		String orgFileName = mFile.getOriginalFilename();
		// 파일 사이즈
		long fileSize = mFile.getSize();
		// 저장할 파일의 상세 경로
		String filePath = realPath + File.separator;
		// 디렉토리를 만들 파일 객체 생성
		File file = new File(filePath);
		if (!file.exists()) {// 디렉토리가 존재하지 않는다면
			file.mkdir();// 디렉토리를 만든다.
		}

		// 파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
		String saveFileName = System.currentTimeMillis() + orgFileName;
		try {
			// upload 폴더에 파일을 저장한다.
			mFile.transferTo(new File(filePath + saveFileName));
		} catch (Exception e) {
			e.printStackTrace();
		}

		// FileDto 객체에 추가 정보를 담는다.
		dto.setOrgFileName(orgFileName);
		dto.setSaveFileName(saveFileName);
		dto.setFileSize(fileSize);
		dto.setId(dto.getId());
		dto.setKakao(dto.getKakao());
		dto.setPhone(dto.getPhone());
		dto.setAddr(dto.getAddr());
		dto.setSex(dto.getSex());
		dto.setHasPet(dto.getHasPet());
		dto.setEvaluation(0);
		dto.setImagePath("/upload/" + saveFileName);

		// 비밀번호 암호화를 도와주는 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// Dto 에 있는 비밀번호를 암호화 한다.
		String encodedPwd = encoder.encode(dto.getPwd());
		// 암호화된 비밀번호를 UsersDto에 다시 담는다.
		dto.setPwd(encodedPwd);
		// Dao 를 이용해서 회원 정보를 저장한다.
		dao.insert(dto);
		// request 에 담을 내용을 ModelAndView 객체에 담는다.
		mView.addObject("msg", dto.getId() + " 회원님 가입되었습니다.");

	}

	@Override
	public void login(ModelAndView mView, PetwalkerDto dto, HttpSession session) {
		// 로그인 성공여부를 담을 지역 변수
		boolean isLoginSuccess = false;
		// 인자로 전달된 Dto 에 있는 회원의 아이디를 이용해서
		// Select 한다.
		PetwalkerDto resultDto = dao.getData(dto.getId());
		// 해당 아이디가 DB 에 존재한다면
		if (resultDto != null) {
			// 사용자가 입력한 비밀번호와 DB에 저장된 암호화된 비밀번호
			// 를 비교해서 일치하는지 판단해야한다.
			isLoginSuccess = BCrypt.checkpw(dto.getPwd(), resultDto.getPwd());
		}
		if (isLoginSuccess) {
			// 로그인 처리를 해준다.
			session.setAttribute("id", dto.getId());

			session.setAttribute("isWalker", true);
		}
		// request 에 담을 내용을 ModelAndView 객체에 담는다.
		mView.addObject("isLoginSuccess", isLoginSuccess);
	}

	@Override
	public void info(ModelAndView mView, HttpSession session) {
		// 세션에 저장된 아이디를 읽어와서
		String id = (String) session.getAttribute("id");
		// 해당 회원정보를 얻어와서
		PetwalkerDto dto = dao.getData(id);
		
		String nickname = dto.getNickname();
		mView.addObject("dto", dto);
		mView.addObject("nickname", nickname);
		
	}

	@Override
	public void updateForm(ModelAndView mView, HttpSession session) {
		String id = (String) session.getAttribute("id");
		PetwalkerDto dto = dao.getData(id);
		mView.addObject("dto", dto);

	}

	@Override
	public void update(HttpServletRequest request, PetwalkerDto dto) {

		PetwalkerDto getDto = dao.getData(dto.getId());// 현재 아이디로 찾아온 정보
	    System.out.println(getDto.getImagePath()+"지금 아이디에 들어있는 imagePath");
	    System.out.println(dto.getFile().getOriginalFilename()+ "넘겨준 imagePath"); //수정하면 이게 넘겨짐 수정 안했으면 ""임 확인해보기
	    
	    MultipartFile mFile2 = dto.getFile(); //넘겨진 이미지 getFile로 받아옴 mFil2에 
	    
		if (mFile2.getOriginalFilename() == "") {//image는 건들지 말고 다른것들만 update하자
			dto.setImagePath(getDto.getImagePath());
			dto.setFileSize(getDto.getFileSize());
			dto.setOrgFileName(getDto.getOrgFileName());
			dto.setSaveFileName(getDto.getSaveFileName());
			dto.setKakao(dto.getKakao());
			dto.setPhone(dto.getPhone());
			dto.setAddr(dto.getAddr());
			dto.setHasPet(dto.getHasPet());
			System.out.println("image 수정을 하지 않았어요!!");
			
		} else {//다르다면 업데이트 된것이기 떄문에 다 업데이트 
			// 파일을 저장할 폴더의 절대 경로를 얻어온다.
			String realPath = request.getSession().getServletContext().getRealPath("/upload");
			// 콘솔에 경로 출력해보기

			// MultipartFile 객체의 참조값 얻어오기
			// FileDto 에 담긴 MultipartFile 객체의 참조값을 얻어온다.
			MultipartFile mFile = dto.getFile();
			
			// 원본 파일명
			String orgFileName = mFile.getOriginalFilename();
			// 파일 사이즈
			long fileSize = mFile.getSize();
			// 저장할 파일의 상세 경로
			String filePath = realPath + File.separator;
			// 디렉토리를 만들 파일 객체 생성
			File file = new File(filePath);
			if (!file.exists()) {// 디렉토리가 존재하지 않는다면
				file.mkdir();// 디렉토리를 만든다.
			}

			// 파일 시스템에 저장할 파일명을 만든다. (겹치치 않게)
			String saveFileName = System.currentTimeMillis() + orgFileName;
			try {
				// upload 폴더에 파일을 저장한다.
				mFile.transferTo(new File(filePath + saveFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}

			dto.setOrgFileName(orgFileName);
			dto.setSaveFileName(saveFileName);
			dto.setFileSize(fileSize);
			dto.setImagePath("/upload/" + saveFileName);

			dto.setKakao(dto.getKakao());
			dto.setPhone(dto.getPhone());
			dto.setAddr(dto.getAddr());
			dto.setHasPet(dto.getHasPet());
			System.out.println("image 수정을 했어요");
		}

		dao.update(dto);

	}

	@Override
	public boolean isValidPwd(String inputPwd, HttpSession session) {
		// 세션영역에 저장된 아이디를 읽어와서
		String id = (String) session.getAttribute("id");
		// DB 에서 해당 정보를 얻어와서
		PetwalkerDto dto = dao.getData(id);
		// 일치하는지 여부를
		boolean isValid = BCrypt.checkpw(inputPwd, dto.getPwd());
		// 리턴하기
		return isValid;
	}

	@Override
	public void updatePwd(String pwd, HttpSession session) {
		// 세션에 저장된 아이디
		String id = (String) session.getAttribute("id");
		// 비밀번호 암호화
		String encodedPwd = new BCryptPasswordEncoder().encode(pwd);
		// UsersDto 객체에 두개의 정보 담기
		PetwalkerDto dto = new PetwalkerDto();
		dto.setId(id);
		dto.setPwd(encodedPwd);
		// UsersDto 객체를 인자로 전달해서 비밀번호 수정하기
		dao.updatePwd(dto);
	}

	@Override
	public void updateImg(String pwd, HttpSession session) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(ModelAndView mView, HttpSession session) {
		// 세션에 저장된 아이디를 읽어온다.
		String id = (String) session.getAttribute("id");
		// DB 에서 해당 정보를 삭제한다.
		dao.delete(id);
		// 로그 아웃 처리를 한다.
		session.invalidate();
		// ModelAndView 객체에 메세지를 담는다.
		mView.addObject("msg", id + " 님 회원 탈퇴 되었습니다.");
	}

}
