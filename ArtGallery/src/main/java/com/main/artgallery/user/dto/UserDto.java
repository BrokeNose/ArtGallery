package com.main.artgallery.user.dto;

public class UserDto {
	private String id;
	private String pwd;
	private String email;
	private char roll;
	private String regdate;
	private String deldate;
	private String rollName;
	private int startRowNum;
	private int endRowNum;
	
	public UserDto() {}

	public UserDto(String id, String pwd, String email, char roll, String regdate, String deldate, String rollName,
			int startRowNum, int endRowNum) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.roll = roll;
		this.regdate = regdate;
		this.deldate = deldate;
		this.rollName = rollName;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
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

	public String getRollName() {
		return rollName;
	}

	public void setRollName(String rollName) {
		this.rollName = rollName;
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

	

		
}
