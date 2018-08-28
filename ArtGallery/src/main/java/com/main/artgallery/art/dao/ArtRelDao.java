package com.main.artgallery.art.dao;

import java.util.List;

import com.main.artgallery.art.dto.ArtRelDto;


public interface ArtRelDao {

	//-------- Son ----------------------
	
	
	
	//-------- hyung ----------------------
	// 비고 : 자료 관리는 연계자료 delete 후 insert하는 방식으로 처리 됨. 그래서  update가 없음
	public List<ArtRelDto> getList(ArtRelDto dto);
	public void insert(ArtRelDto dto);	// 
	public void delete(int seq);
}
