package com.main.artgallery.category.dto;

public class CategoryDto {
	private int seq;
	private String code;
	private String name;
	private String remark;
	private String imagepath;
	private String bdate;
	private String ddate;
	
	public CategoryDto() {}

	public CategoryDto(int seq, String code, String name, String remark, String imagepath, String bdate, String ddate) {
		super();
		this.seq = seq;
		this.code = code;
		this.name = name;
		this.remark = remark;
		this.imagepath = imagepath;
		this.bdate = bdate;
		this.ddate = ddate;
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
	
}
