package com.main.artgallery.user.dto;

public class UserDto {
	private String id;
	private String pwd;
	private String email;
	private char roll;
	private String regdate;
	private String deldate;
	
	public UserDto() {}

	public UserDto(String id, String pwd, String email, char roll, String regdate, String deldate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.roll = roll;
		this.regdate = regdate;
		this.deldate = deldate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public char getRoll() {
		return roll;
	}

	public void setRoll(char roll) {
		this.roll = roll;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getDeldate() {
		return deldate;
	}

	public void setDeldate(String deldate) {
		this.deldate = deldate;
	}
	
}
