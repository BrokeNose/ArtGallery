package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.favorart.dto.FavorArtDto;

public interface FavorArtService {
	public void getList(ModelAndView mView, HttpServletRequest request);
	public void getData(HttpServletRequest request, ModelAndView mView);
	public void getConfig(HttpServletRequest request);
	public void update(HttpServletRequest request);
}
