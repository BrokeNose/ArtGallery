package com.main.artgallery.service;

import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dto.ArtDto;


/*
 * 작성자 : hyung
 * 비고 : 
 */
public interface ArtService {

	public void getList(ModelAndView mView, ArtDto dto);
	public void getData(ModelAndView mView, int seq);
	public void insert(ModelAndView mView, ArtDto dto);
	public void update(ModelAndView mView, ArtDto dto);
	public void delete(ModelAndView mView, int seq);
	public int  getSequence();			// sequence값 가져오기
}
