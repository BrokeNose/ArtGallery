package com.main.artgallery.user.dto;

public class UserDto {
	private String id;
	private String pwd;
	private String email;
	private String roll;
	private String regdate;
	private String deldate;
	private String rollName;
	
	private int userCount;
	private int adminCount;
	private int allCount;
	
    //페이징관련
    private int startRowNum;
	private int endRowNum;	
	private int rnum;		//oracle rownum
	
	// 검색, 페이징 관련
	private String searchKeyword;	 // 검색어
	private String searchCondition;  // 항목
	private int pageNum;			 // 조회페이지
	
	
	public UserDto() {}


	public UserDto(String id, String pwd, String email, String roll, String regdate, String deldate, String rollName,
			int userCount, int adminCount, int allCount, int startRowNum, int endRowNum, int rnum, String searchKeyword,
			String searchCondition, int pageNum) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.roll = roll;
		this.regdate = regdate;
		this.deldate = deldate;
		this.rollName = rollName;
		this.userCount = userCount;
		this.adminCount = adminCount;
		this.allCount = allCount;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.rnum = rnum;
		this.searchKeyword = searchKeyword;
		this.searchCondition = searchCondition;
		this.pageNum = pageNum;
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


	public String getRoll() {
		return roll;
	}


	public void setRoll(String roll) {
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


	public int getUserCount() {
		return userCount;
	}


	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}


	public int getAdminCount() {
		return adminCount;
	}


	public void setAdminCount(int adminCount) {
		this.adminCount = adminCount;
	}


	public int getAllCount() {
		return allCount;
	}


	public void setAllCount(int allCount) {
		this.allCount = allCount;
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


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	public String getSearchCondition() {
		return searchCondition;
	}


	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}


	public int getPageNum() {
		return pageNum;
	}


	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	
}
