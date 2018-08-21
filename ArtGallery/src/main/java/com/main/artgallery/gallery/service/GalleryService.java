package com.main.artgallery.gallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface GalleryService {
	public void getList(HttpServletRequest request,ModelAndView mView);
	
}