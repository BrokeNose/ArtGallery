package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface ConfigService {
	public void getData(HttpServletRequest request, String code);
}
