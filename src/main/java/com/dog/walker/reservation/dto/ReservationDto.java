package com.dog.walker.reservation.dto;

public class ReservationDto {
	private int num;
	private String id;
	private String kakao;
	private String nickname;
	private String dogSize;
	private String selectDate;
	private String timeSlot;
	private String cctv;
	private String petwalker;
	private int isReserved;
	
	
	public ReservationDto() {}


	public ReservationDto(int num, String id, String kakao, String nickname, String dogSize, String selectDate,
			String timeSlot, String cctv, String petwalker, int isReserved) {
		super();
		this.num = num;
		this.id = id;
		this.kakao = kakao;
		this.nickname = nickname;
		this.dogSize = dogSize;
		this.selectDate = selectDate;
		this.timeSlot = timeSlot;
		this.cctv = cctv;
		this.petwalker = petwalker;
		this.isReserved = isReserved;
	}


	public int getNum() {
		return num;
	}


	public void setNum(int num) {
		this.num = num;
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


	public String getPetwalker() {
		return petwalker;
	}


	public void setPetwalker(String petwalker) {
		this.petwalker = petwalker;
	}


	public int getIsReserved() {
		return isReserved;
	}


	public void setIsReserved(int isReserved) {
		this.isReserved = isReserved;
	}
	
	
	
	
	
	
	
}
