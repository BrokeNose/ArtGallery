package com.main.artgallery.opinion.dao;

import java.util.List;

import com.main.artgallery.opinion.dto.OpinionCommentDto;

public interface OpinionCommentDao {
	//새로운 댓글의 글번호를 리턴해주는 메소드 
	public int getSequence();
	//새로운 댓글을 저장하는 메소드 
	public void insert(OpinionCommentDto dto);
	//인자로 전달되는 그룹에 해당하는 댓글 목록을 리턴하는 메소드 
	public List<OpinionCommentDto> getList(int ref_group);
	public void delete(int ref_group);
}












