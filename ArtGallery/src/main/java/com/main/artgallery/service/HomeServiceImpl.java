package com.main.artgallery.service;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.category.dao.CategoryDao;
import com.main.artgallery.category.dto.CategoryDto;
import com.main.artgallery.config.dao.ConfigDao;
import com.main.artgallery.config.dto.ConfigDto;
import com.main.artgallery.opinion.dao.OpinionDao;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ConfigService cfService;	
	private ConfigDto configDto=null;
	@Autowired
	private OpinionDao opinionDao;

	@Override
	public void getToday(HttpServletRequest request, ModelAndView mView) {
		getConfig(request);
		mView.addObject("configDto", configDto);
		List<CategoryDto> listT=categoryDao.getList("A");
		CategoryDto random=listT.get(new Random().nextInt(listT.size()));
		mView.addObject("today", random);
	}
	@Override
	public void getListA(HttpServletRequest request, ModelAndView mView) {
		getConfig(request);
		mView.addObject("configDto", configDto);
		mView.addObject("listA", categoryDao.getList("A"));
	}
	@Override
	public void getListM(HttpServletRequest request, ModelAndView mView) {
		getConfig(request);
		mView.addObject("configDto", configDto);
		mView.addObject("listM", categoryDao.getList("M"));
	}
	@Override
	public void getListP(HttpServletRequest request, ModelAndView mView) {
		getConfig(request);
		mView.addObject("configDto", configDto);
		mView.addObject("listP", categoryDao.getList("P"));
	}
	@Override
	public void getConfig(HttpServletRequest request) {
		// ConfigService 에서 가져오면 request에 담겨져 있으므로 다시 가져온다.
		cfService.getData(request, "1");
		configDto=(ConfigDto)request.getAttribute("configDto");		
	}
//	@Override
//	public void getOpinionCount(HttpServletRequest request) {
//		int opinionCount=opinionDao.getCountNoView();
//		request.setAttribute("opinionCount", opinionCount);
//	}
}
