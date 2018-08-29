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
	
	private MultipartFile file;	
	

	public CategoryDto() {}

	//Son 추가한것 업데이트
	public CategoryDto(int seq, String code, String name, String remark, String imagepath, String bdate, String ddate,
			String codename, int artcount, int viewcount, MultipartFile file) {
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


	public MultipartFile getFile() {
		return file;
	}


	public void setFile(MultipartFile file) {
		this.file = file;
	}

	
	
}
