package com.main.artgallery.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.service.ArtService;

/*
 * 작성자 : hyung
 * 비고 : 
 */

@Controller
public class ArtController {
	@Autowired
	private ArtService aService;
	
	//관리자 작품 목록
	@RequestMapping("/admin/art/list.do")
	public ModelAndView adminArtList(HttpServletRequest request, ModelAndView mView, @ModelAttribute ArtDto dto) {
		aService.getList(mView, dto);
		mView.setViewName("admin/art/list");
		return mView;
	}
	//관리자 작품 등록화면
	@RequestMapping("/admin/art/insertform.do")
	public ModelAndView adminArtInsertform(HttpServletRequest request) {
		return new ModelAndView("admin/art/insertform");
	}
}
