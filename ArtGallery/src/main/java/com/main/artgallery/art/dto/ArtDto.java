package com.main.artgallery.art.dto;
/*
작성자 : Son
비고   : v_art 와 페이징 관련 dto
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
	
	//view 추가 항목 (v_art)
	private String artist;
    private String painter;
    private String material;
	
    //v_art의 t_cateogory 항목
    private int cseq;
    private String code;	//A, P, M
    private String name;
    
    //페이징관련
    private int startRowNum;
	private int endRowNum;
	private int prevNum; //이전글의 글번호
	private int nextNum; //다음글의 글번호
	private int sortField;	// 목록 소트 구분자
	
	public ArtDto() {}

	public ArtDto(int seq, String title, String createyear, String artsize, String remark, String imagepath,
			int viewcount, String regdate, String artist, String painter, String material, int cseq, String code,
			String name, int startRowNum, int endRowNum, int prevNum, int nextNum, int sortField) {
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
		this.cseq = cseq;
		this.code = code;
		this.name = name;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
		this.sortField = sortField;
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

	public int getCseq() {
		return cseq;
	}

	public void setCseq(int cseq) {
		this.cseq = cseq;
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

	public int getSortField() {
		return sortField;
	}

	public void setSortField(int sortField) {
		this.sortField = sortField;
	}

}
