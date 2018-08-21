package com.main.artgallery.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.service.CategoryService;



@Controller
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	// SHong,.
	@RequestMapping("/admin/adminCategory")
	public ModelAndView AdminCategory(HttpServletRequest request, ModelAndView mView) {
		categoryService.getList(request, mView);
		mView.setViewName("redirect:/admin/admin_category.jsp");
		return mView;
	}
	
}
