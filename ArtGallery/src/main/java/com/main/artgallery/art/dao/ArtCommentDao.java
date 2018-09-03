package com.main.artgallery.art.dao;

import java.util.List;

import com.main.artgallery.art.dto.ArtCommentDto;

public interface ArtCommentDao {
	public int getSequence();
	public void insert(ArtCommentDto dto);
	public void delete(int num);
	public List<ArtCommentDto> getList(ArtCommentDto dto);
	public int getCount(ArtCommentDto dto);
}
