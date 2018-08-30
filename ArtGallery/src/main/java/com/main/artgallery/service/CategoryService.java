package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.category.dto.CategoryDto;

public interface CategoryService {
	public void getList(HttpServletRequest request, ModelAndView mView);
	//son
	public void SonGetList(HttpServletRequest request, ModelAndView mView);
	public void SonGetData(HttpServletRequest request, ModelAndView mView);
	
	//////////////////////////////////////////////////////////////////

	public void getSearchList(HttpServletRequest request, ModelAndView mView);
	public void getConfig(HttpServletRequest request);
	
	//Shin
	public void insertForm(HttpServletRequest request, ModelAndView mView);
	public void insert(HttpServletRequest request, CategoryDto dto);
}