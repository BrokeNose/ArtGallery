package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface HomeService {
	public void getToday(HttpServletRequest request, ModelAndView mView);
	public void getListA(HttpServletRequest request, ModelAndView mView);
	public void getListM(HttpServletRequest request, ModelAndView mView);
	public void getListP(HttpServletRequest request, ModelAndView mView);
	public void getConfig(HttpServletRequest request);
}
