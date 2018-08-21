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
		
		System.out.println("11111111111111");
		if (categoryType==null) {
			
		}else if(categoryType.equals("A")) {
			System.out.println("222222222222222");
			mView.addObject("list",dao.AGetList());
			System.out.println("555555555555555");
			
		}else if(categoryType.equals("M")) {
			System.out.println("333333333333333333");
			mView.addObject("list",dao.MGetList());
			System.out.println("666666666666666");
		}else if(categoryType.equals("P")) {
			System.out.println("4444444444444");
			mView.addObject("list",dao.PGetList());
			System.out.println("6666666666666666");
		}
	}
}
