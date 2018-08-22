package com.main.artgallery.artrel.dao;

import java.util.List;

import com.main.artgallery.artrel.dto.ArtRelDto;

/*
 * 작성자 : hyung
 * 비고 : 자료 관리는 연계자료 delete 후 insert하는 방식으로 처리 됨. 그래서  update가 없음
 */

public interface ArtRelDao {
	public List<ArtRelDto> getList(ArtRelDto dto);
	public void insert(ArtRelDto dto);	// 
	public void delete(int seq);
}
