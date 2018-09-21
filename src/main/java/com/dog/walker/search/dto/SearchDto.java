package com.dog.walker.search.dto;


public class SearchDto {

	private String addProfilePath;
	private String ProfilePath;
	private String nickname;
	private String id;
	private String addr;
	private String sex;
	private String hasPet;
	
	
	public SearchDto() {}
	
	public SearchDto(String addProfilePath, String profilePath, String nickname, String id, String addr, String sex,
			String hasPet) {
		super();
		this.addProfilePath = addProfilePath;
		ProfilePath = profilePath;
		this.nickname = nickname;
		this.id = id;
		this.addr = addr;
		this.sex = sex;
		this.hasPet = hasPet;
	}
	public String getAddProfilePath() {
		return addProfilePath;
	}
	public void setAddProfilePath(String addProfilePath) {
		this.addProfilePath = addProfilePath;
	}
	public String getProfilePath() {
		return ProfilePath;
	}
	public void setProfilePath(String profilePath) {
		ProfilePath = profilePath;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	
	
}
