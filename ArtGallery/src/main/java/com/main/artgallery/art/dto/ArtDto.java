package com.main.artgallery.art.dto;

public class ArtDto {
	private int seq;
	private String title;
	private String createyear;
	private String artsize;
	private String remark;
	private String imagepath;
	private int viewcount;
	private String regdate;
	
	public ArtDto() {}
	public ArtDto(int seq, String title, String createyear, String artsize, String remark, String imagepath,
			int viewcount, String regdate) {
		super();
		this.seq = seq;
		this.title = title;
		this.createyear = createyear;
		this.artsize = artsize;
		this.remark = remark;
		this.imagepath = imagepath;
		this.viewcount = viewcount;
		this.regdate = regdate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreateyear() {
		return createyear;
	}
	public void setCreateyear(String createyear) {
		this.createyear = createyear;
	}
	public String getArtsize() {
		return artsize;
	}
	public void setArtsize(String artsize) {
		this.artsize = artsize;
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
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}
