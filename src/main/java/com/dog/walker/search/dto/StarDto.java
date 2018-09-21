package com.dog.walker.search.dto;

public class StarDto {
	private String nickname;
	private double stars;
	
	public StarDto() {}

	public StarDto(String nickname, double stars) {
		super();
		this.nickname = nickname;
		this.stars = stars;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public double getStars() {
		return stars;
	}

	public void setStars(double stars) {
		this.stars = stars;
	}

	
}
