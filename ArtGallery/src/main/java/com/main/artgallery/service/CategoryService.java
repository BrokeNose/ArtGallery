package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface CategoryService {
	public void getList(HttpServletRequest request,ModelAndView mView);
	public void SonGetList(HttpServletRequest request, ModelAndView mView);
}