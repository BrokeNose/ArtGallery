package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dto.ArtDto;

public interface ArtService {
	//-------- Son ----------------------

	
	
	//-------- hyung ----------------------
	
	public void getList(ModelAndView mView, ArtDto dto);
	public void getData(ModelAndView mView, ArtDto dto);
	public void insert(HttpServletRequest request, ArtDto dto);
	public void update(HttpServletRequest request, ArtDto dto);
	public void delete(HttpServletRequest request, int seq);
	public int  getSequence();				// sequence값 가져오기
	public void insertRel(int seq, String relData);	// 연계 텍스트 자료 분리해서 insert 하기
	public void fileDelete(String realPath, String imagePath);		// 파일삭제
	public void getConfig(HttpServletRequest request);
}
