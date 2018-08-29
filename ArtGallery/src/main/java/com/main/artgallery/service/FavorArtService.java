package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.favorart.dto.FavorArtDto;

public interface FavorArtService {
	public void getList(ModelAndView mView, HttpServletRequest request);
	public void getData(HttpServletRequest request, ModelAndView mView, FavorArtDto dto);
	public void update(HttpServletRequest request, FavorArtDto dto);
	public void getConfig();
}
