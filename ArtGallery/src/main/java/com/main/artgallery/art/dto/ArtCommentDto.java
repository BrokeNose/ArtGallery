package com.main.artgallery.art.dto;

public class ArtCommentDto {
	private int num;
	private String writer;
	private String content;
	private String target_id;	// 사용안함
	private int seq;			// t_art.seq
	private int comment_group;	// 그룹별 t_artcomment.num, 사용안함
	private String regdate; 

    //페이징관련
    private int startRowNum;
	private int endRowNum;
	private int rnum;		//oracle rownum
	
	// 검색, 페이징 관련
	private String searchCommentKeyword;	 // 검색어
	private String searchCommentCondition;  // 항목
	private int commentCommentPageNum;			 // 조회페이지

	public ArtCommentDto() {}

	public ArtCommentDto(int num, String writer, String content, String target_id, int seq, int comment_group,
			String regdate, int startRowNum, int endRowNum, int rnum, String searchCommentKeyword, String searchCommentCondition,
			int commentCommentPageNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.target_id = target_id;
		this.seq = seq;
		this.comment_group = comment_group;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.rnum = rnum;
		this.searchCommentKeyword = searchCommentKeyword;
		this.searchCommentCondition = searchCommentCondition;
		this.commentCommentPageNum = commentCommentPageNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTarget_id() {
		return target_id;
	}

	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getComment_group() {
		return comment_group;
	}

	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

	public String getSearchCommentKeyword() {
		return searchCommentKeyword;
	}

	public void setSearchCommentKeyword(String searchCommentKeyword) {
		this.searchCommentKeyword = searchCommentKeyword;
	}

	public String getSearchCommentCondition() {
		return searchCommentCondition;
	}

	public void setSearchCommentCondition(String searchCommentCondition) {
		this.searchCommentCondition = searchCommentCondition;
	}

	public int getCommentPageNum() {
		return commentCommentPageNum;
	}

	public void setCommentPageNum(int commentCommentPageNum) {
		this.commentCommentPageNum = commentCommentPageNum;
	}

}
