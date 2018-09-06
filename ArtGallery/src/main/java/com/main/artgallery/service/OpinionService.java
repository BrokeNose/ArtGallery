package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.opinion.dto.OpinionCommentDto;


public interface OpinionService {
	public void getList(HttpServletRequest request);
	public void insert(HttpServletRequest request);
	public void detail(HttpServletRequest request);
	public void commentInsert(OpinionCommentDto dto);
	public void delete(HttpServletRequest request);
	public void update(HttpServletRequest request);
	public void getCountNoView(HttpServletRequest request);
}













