package com.dog.walker.petwalker.dto;

import org.springframework.web.multipart.MultipartFile;


public class PetwalkerDto {
	private String id;
	private String nickname;
	private String pwd;
	private String kakao;
	private String phone;
	private String addr;
	private String sex;
	private String imagePath;
	private String hasPet;
	private int evaluation;
	private String regdate;
	private String orgFileName; //원본 파일명
	private String saveFileName; //저장된 파일명
	private long fileSize; //파일의 크기 
	private MultipartFile file;
	private String isProfiled; //불리언으로 할거임
	
	
	public PetwalkerDto() {}

	public PetwalkerDto(String id, String nickname, String pwd, String kakao, String phone, String addr, String sex,
			String imagePath, String hasPet, int evaluation, String regdate, String orgFileName, String saveFileName,
			long fileSize, MultipartFile file, String isProfiled) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.pwd = pwd;
		this.kakao = kakao;
		this.phone = phone;
		this.addr = addr;
		this.sex = sex;
		this.imagePath = imagePath;
		this.hasPet = hasPet;
		this.evaluation = evaluation;
		this.regdate = regdate;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.file = file;
		this.isProfiled = isProfiled;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getKakao() {
		return kakao;
	}

	public void setKakao(String kakao) {
		this.kakao = kakao;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getHasPet() {
		return hasPet;
	}

	public void setHasPet(String hasPet) {
		this.hasPet = hasPet;
	}

	public int getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(int evaluation) {
		this.evaluation = evaluation;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getOrgFileName() {
		return orgFileName;
	}

	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getIsProfiled() {
		return isProfiled;
	}

	public void setIsProfiled(String isProfiled) {
		this.isProfiled = isProfiled;
	}
	
	
}
