package com.main.artgallery.artcomment.dto;

public class ArtCommentDto {
	private int num;
	private String writer;
	private String content;
	private String target_id;
	private int seq;
	private int comment_group;
	private String regdate; 
	
	public ArtCommentDto() {}

	public ArtCommentDto(int num, String writer, String content, String target_id, int seq, int comment_group,
			String regdate) {
		super();
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.target_id = target_id;
		this.seq = seq;
		this.comment_group = comment_group;
		this.regdate = regdate;
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
	
}
