package com.main.artgallery.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.category.dao.CategoryDao;
import com.main.artgallery.category.dto.CategoryDto;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao dao;
	
	@Override
	public void getList(HttpServletRequest request,ModelAndView mView) {
		String categoryType=(String)request.getParameter("categorytype");
		
		if (categoryType==null) {
			mView.addObject("list",dao.AGetList());
			mView.addObject("categoryType", "A");
		}else if(categoryType.equals("A")) {
			mView.addObject("list",dao.AGetList());
			mView.addObject("categoryType", "A");
		}else if(categoryType.equals("M")) {
			mView.addObject("list",dao.MGetList());
			mView.addObject("categoryType", "M");
		}else if(categoryType.equals("P")) {
			mView.addObject("list",dao.PGetList());
			mView.addObject("categoryType", "P");
		}
	}
	
	//son
	@Override
	public void SonGetList(HttpServletRequest request, ModelAndView mView) {
		String SonCategoryType=(String)request.getParameter("soncategorytype");
		
		if (SonCategoryType==null) {
			mView.addObject("list",dao.getAList());
			mView.addObject("SonCategoryType", "A");
		}else if(SonCategoryType.equals("A")) {
			mView.addObject("list",dao.getAList());
			mView.addObject("SonCategoryType", "A");
		}else if(SonCategoryType.equals("M")) {
			mView.addObject("list",dao.getMList());
			mView.addObject("SonCategoryType", "M");
		}else if(SonCategoryType.equals("P")) {
			mView.addObject("list",dao.getPList());
			mView.addObject("SonCategorytype","P");
		}
	}
	
	@Override
	public void SonGetData(HttpServletRequest request, ModelAndView mView) {
		int seq=(int)request.getParameter("seq");

	}

	
	@Override
	public void getSearchList(HttpServletRequest request, ModelAndView mView) {
		CategoryDto dto=new CategoryDto();
		dto.setCode(request.getParameter("code"));
		if (request.getParameter("keyword") != null ){
			dto.setName(request.getParameter("keyword"));
		}
		//request에 담아야 controller에서 읽어서 json 처리 할 수 있음
		request.setAttribute("list",  dao.getSearchList(dto));	
	}

	
	
}

	
