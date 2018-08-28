package com.main.artgallery.art.dto;

import org.springframework.web.multipart.MultipartFile;

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
	private int artcount;
	
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
	private int prevNum; 	//이전글의 글번호
	private int nextNum; 	//다음글의 글번호
	private String sortField;	//목록 소트 구분자
	private int rnum;		//oracle rownum
	
	// 검색, 페이징 관련
	private String searchKeyword;	 // 검색어
	private String searchCondition;  // 항목
	private int pageNum;			 // 조회페이지
	
	/*
	 *  업로드된 파일의 정보를 담을 필드
	 *  <input type="file" name="file" />
	 *  
	 *  name 속성의 value 와 같게 필드명을 정해야 한다. 
	 */
	private MultipartFile file;

	public ArtDto() {}

	public ArtDto(int seq, String title, String createyear, String artsize, String remark, String imagepath,
			int viewcount, String regdate, int artcount, String artist, String painter, String material, int cseq,
			String code, String name, int startRowNum, int endRowNum, int prevNum, int nextNum, String sortField,
			int rnum, String searchKeyword, String searchCondition, int pageNum, MultipartFile file) {
		super();
		this.seq = seq;
		this.title = title;
		this.createyear = createyear;
		this.artsize = artsize;
		this.remark = remark;
		this.imagepath = imagepath;
		this.viewcount = viewcount;
		this.regdate = regdate;
		this.artcount = artcount;
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

	public int getArtcount() {
		return artcount;
	}

	public void setArtcount(int artcount) {
		this.artcount = artcount;
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
