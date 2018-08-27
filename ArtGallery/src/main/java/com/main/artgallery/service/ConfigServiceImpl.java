package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.artgallery.config.dao.ConfigDao;
import com.main.artgallery.config.dto.ConfigDto;

@Service
public class ConfigServiceImpl implements ConfigService {
	@Autowired
	private ConfigDao dao;
	
	@Override
	public void getData(HttpServletRequest request, String code) {
		ConfigDto dto=dao.getData(code);		
		request.setAttribute("configDto", dto);
	}

}
