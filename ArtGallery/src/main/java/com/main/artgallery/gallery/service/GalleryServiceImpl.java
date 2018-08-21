package com.main.artgallery.gallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.category.dao.CategoryDao;

@Service
public class GalleryServiceImpl implements GalleryService {
	@Autowired
	private CategoryDao dao;
	
	@Override
	public void getList(HttpServletRequest request,ModelAndView mView) {
		String categoryType=(String)request.getParameter("categorytype");
		
		if (categoryType==null) {
			
		}else if(categoryType.equals("A")) {
			mView.addObject("list",dao.AGetList());
			
		}else if(categoryType.equals("M")) {
			mView.addObject("list",dao.MGetList());
		}else if(categoryType.equals("P")) {
			mView.addObject("list",dao.PGetList());
		}
	}

	@Override
	public void insert() {
		// TODO Auto-generated method stub
		
	}
}
