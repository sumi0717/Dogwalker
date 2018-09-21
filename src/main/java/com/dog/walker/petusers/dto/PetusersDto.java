package com.dog.walker.petusers.dto;

import org.springframework.web.multipart.MultipartFile;

public class PetusersDto {
	private String id;
	private String nickname;
	private String pwd;
	private String kakao;
	private String phone;
	private String addr;
	private String sex;
	private String hasPet;
	private String imagePath;
	private String regdate;
	private String orgFileName;
	private String saveFileName;
	private long fileSize;
	private MultipartFile file;
	private int isConfirmed;
	
	public PetusersDto() {}

	public PetusersDto(String id, String nickname, String pwd, String kakao, String phone, String addr, String sex,
			String hasPet, String imagePath, String regdate, String orgFileName, String saveFileName, long fileSize,
			MultipartFile file, int isConfirmed) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.pwd = pwd;
		this.kakao = kakao;
		this.phone = phone;
		this.addr = addr;
		this.sex = sex;
		this.hasPet = hasPet;
		this.imagePath = imagePath;
		this.regdate = regdate;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.file = file;
		this.isConfirmed = isConfirmed;
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

	public String getHasPet() {
		return hasPet;
	}

	public void setHasPet(String hasPet) {
		this.hasPet = hasPet;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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

	public int getIsConfirmed() {
		return isConfirmed;
	}

	public void setIsConfirmed(int isConfirmed) {
		this.isConfirmed = isConfirmed;
	}


	
}
