package com.main.artgallery.art.dto;
/*
작성자 : Son
비고   : 간단설명
*/
public class ArtDto {
	private int seq;
	private String title;
	private String createyear;
	private String artsize;
	private String remark;
	private String imagepath;
	private int viewcount;
	private String regdate;
	private String artist;
    private String painter;
    private String material;
	
	public ArtDto() {}

	public ArtDto(int seq, String title, String createyear, String artsize, String remark, String imagepath,
			int viewcount, String regdate, String artist, String painter, String material) {
		super();
		this.seq = seq;
		this.title = title;
		this.createyear = createyear;
		this.artsize = artsize;
		this.remark = remark;
		this.imagepath = imagepath;
		this.viewcount = viewcount;
		this.regdate = regdate;
		this.artist = artist;
		this.painter = painter;
		this.material = material;
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

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getPainter() {
		return painter;
	}

	public void setPainter(String painter) {
		this.painter = painter;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}
	
	
	
}
