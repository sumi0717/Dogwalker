package com.dog.walker.manage.dto;

import org.springframework.web.multipart.MultipartFile;

import com.dog.walker.petwalker.dto.PetwalkerDto;

public class ManageDto {
	private int num; // sequence not null primary key
	private String writer;
	private String title;
	private String content;
	private int stars;
	private String regdate;
	private String imagePath;
	private String orgImageName;
	private String saveImageName;
	private long ImageSize;
	private int startRowNum;
	private int endRowNum;
	private int prevNum;
	private int nextNum;
	private MultipartFile file;
	// -----------review 끝--------------
	// -----------reservation 시작---------------
	private String id;
	private String kakao;
	private String nickname;
	private String dogSize;
	private String selectDate;
	private String timeSlot;
	private String cctv;
	// -----------reservation 끝---------
	// -----------profile 시작---------------
	private String career;
	private String experience;
	private String freeservice;
	private String filePath;
	private String orgFileName;
	private String saveFileName;
	private long fileSize;
	private MultipartFile file1;
	// -----------profile 끝---------------


	public ManageDto() {
	}
	public ManageDto(int num, String writer, String title, String content, int stars, String regdate, String imagePath,
			String orgImageName, String saveImageName, long imageSize, int startRowNum, int endRowNum, int prevNum,
			int nextNum, MultipartFile file, String id, String kakao, String nickname, String dogSize,
			String selectDate, String timeSlot, String cctv, String career, String experience, String freeservice,
			String filePath, String orgFileName, String saveFileName, long fileSize, MultipartFile file1) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.stars = stars;
		this.regdate = regdate;
		this.imagePath = imagePath;
		this.orgImageName = orgImageName;
		this.saveImageName = saveImageName;
		ImageSize = imageSize;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.file = file;
		this.id = id;
		this.kakao = kakao;
		this.nickname = nickname;
		this.dogSize = dogSize;
		this.selectDate = selectDate;
		this.timeSlot = timeSlot;
		this.cctv = cctv;
		this.career = career;
		this.experience = experience;
		this.freeservice = freeservice;
		this.filePath = filePath;
		this.orgFileName = orgFileName;
		this.saveFileName = saveFileName;
		this.fileSize = fileSize;
		this.file1 = file1;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getOrgImageName() {
		return orgImageName;
	}
	public void setOrgImageName(String orgImageName) {
		this.orgImageName = orgImageName;
	}
	public String getSaveImageName() {
		return saveImageName;
	}
	public void setSaveImageName(String saveImageName) {
		this.saveImageName = saveImageName;
	}
	public long getImageSize() {
		return ImageSize;
	}
	public void setImageSize(long imageSize) {
		ImageSize = imageSize;
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	public int getPrevNum() {
		return prevNum;
	}
	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}
	public int getNextNum() {
		return nextNum;
	}
	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKakao() {
		return kakao;
	}
	public void setKakao(String kakao) {
		this.kakao = kakao;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getDogSize() {
		return dogSize;
	}
	public void setDogSize(String dogSize) {
		this.dogSize = dogSize;
	}
	public String getSelectDate() {
		return selectDate;
	}
	public void setSelectDate(String selectDate) {
		this.selectDate = selectDate;
	}
	public String getTimeSlot() {
		return timeSlot;
	}
	public void setTimeSlot(String timeSlot) {
		this.timeSlot = timeSlot;
	}
	public String getCctv() {
		return cctv;
	}
	public void setCctv(String cctv) {
		this.cctv = cctv;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getExperience() {
		return experience;
	}
	public void setExperience(String experience) {
		this.experience = experience;
	}
	public String getFreeservice() {
		return freeservice;
	}
	public void setFreeservice(String freeservice) {
		this.freeservice = freeservice;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}

	

}