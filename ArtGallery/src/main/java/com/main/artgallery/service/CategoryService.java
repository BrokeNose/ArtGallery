package com.main.artgallery.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface CategoryService {
	public void getList(HttpServletRequest request,ModelAndView mView);
	//son
	public void SonGetList(HttpServletRequest request, ModelAndView mView);
	public void SonGetData(HttpServletRequest request, ModelAndView mView);
	
	
	public void getSearchList(HttpServletRequest request, ModelAndView mView);
	
}