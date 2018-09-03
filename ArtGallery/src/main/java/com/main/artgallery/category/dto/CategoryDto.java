package com.main.artgallery.category.dto;

import org.springframework.web.multipart.MultipartFile;

public class CategoryDto {
	private int seq;
	private String code;
	private String name;
	private String remark;
	private String imagepath;
	private String bdate;
	private String ddate;
	//Son 추가
	private String codename;
	private int artcount;
	private int viewcount;
	
	//Shin 추가
    //페이징관련
    private int startRowNum;
	private int endRowNum;
	private int prevNum; 	//이전글의 글번호
	private int nextNum; 	//다음글의 글번호
	private String sortField;	//목록 소트 구분자
	private int rnum;		//oracle rownum
	
	// 검색, 페이징 관련
	private String searchKeyword;	 // 검색어
	private String searchCondition;  // 항목
	private int pageNum;			 // 조회페이지	
	
	private MultipartFile file;	
	

	public CategoryDto() {}


	public CategoryDto(int seq, String code, String name, String remark, String imagepath, String bdate, String ddate,
			String codename, int artcount, int viewcount, int startRowNum, int endRowNum, int prevNum, int nextNum,
			String sortField, int rnum, String searchKeyword, String searchCondition, int pageNum, MultipartFile file) {
		super();
		this.seq = seq;
		this.code = code;
		this.name = name;
		this.remark = remark;
		this.imagepath = imagepath;
		this.bdate = bdate;
		this.ddate = ddate;
		this.codename = codename;
		this.artcount = artcount;
		this.viewcount = viewcount;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.sortField = sortField;
		this.rnum = rnum;
		this.searchKeyword = searchKeyword;
		this.searchCondition = searchCondition;
		this.pageNum = pageNum;
		this.file = file;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public String getImagepath() {
		return imagepath;
	}


	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}


	public String getBdate() {
		return bdate;
	}


	public void setBdate(String bdate) {
		this.bdate = bdate;
	}


	public String getDdate() {
		return ddate;
	}


	public void setDdate(String ddate) {
		this.ddate = ddate;
	}


	public String getCodename() {
		return codename;
	}


	public void setCodename(String codename) {
		this.codename = codename;
	}


	public int getArtcount() {
		return artcount;
	}


	public void setArtcount(int artcount) {
		this.artcount = artcount;
	}


	public int getViewcount() {
		return viewcount;
	}


	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
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


	public String getSortField() {
		return sortField;
	}


	public void setSortField(String sortField) {
		this.sortField = sortField;
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


	public MultipartFile getFile() {
		return file;
	}


	public void setFile(MultipartFile file) {
		this.file = file;
	}

}
