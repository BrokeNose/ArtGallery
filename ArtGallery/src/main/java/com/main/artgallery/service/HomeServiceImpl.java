package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.category.dao.CategoryDao;
import com.main.artgallery.config.dao.ConfigDao;
import com.main.artgallery.config.dto.ConfigDto;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ConfigDao configDao;
	private ConfigDto configDto=null;
	@Override
	public void getToday(HttpServletRequest request, ModelAndView mView) {
		getConfig();
		mView.addObject("configDto", configDto);
	}
	@Override
	public void getListA(HttpServletRequest request, ModelAndView mView) {
		getConfig();
		mView.addObject("configDto", configDto);
		mView.addObject("listA", categoryDao.getList("A"));
	}
	@Override
	public void getListM(HttpServletRequest request, ModelAndView mView) {
		getConfig();
		mView.addObject("configDto", configDto);
		mView.addObject("listM", categoryDao.getList("M"));
	}
	@Override
	public void getListP(HttpServletRequest request, ModelAndView mView) {
		getConfig();
		mView.addObject("configDto", configDto);
		mView.addObject("listP", categoryDao.getList("P"));
	}
	@Override
	public void getConfig() {
		configDto=configDao.getData("1");
	}
}
