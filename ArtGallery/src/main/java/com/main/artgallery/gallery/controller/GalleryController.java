package com.main.artgallery.gallery.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.gallery.service.GalleryService;

@Controller
public class GalleryController {
	@Autowired
	private GalleryService galleryService;
	
	// SHong,.
	@RequestMapping("/admin/adminCategory")
	public ModelAndView AdminCategory(HttpServletRequest request, ModelAndView mView) {
		galleryService.getList(request, mView);
		mView.setViewName("redirect:/admin/admin_category.jsp");
		return mView;
	}
}
