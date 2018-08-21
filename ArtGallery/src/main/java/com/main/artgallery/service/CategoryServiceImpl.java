package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.category.dao.CategoryDao;

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


}
