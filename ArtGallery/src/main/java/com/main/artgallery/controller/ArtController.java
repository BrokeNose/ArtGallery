package com.main.artgallery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.service.ArtService;

@Controller
public class ArtController {
	@Autowired
	private ArtService aService;
	
	@RequestMapping("/admin/art/list.do")
	public ModelAndView AdminArtList(ModelAndView mView, @ModelAttribute ArtDto dto) {
		aService.getList(mView, dto);
		mView.setViewName("admin/art/list");
		return mView;
	}
	
}
