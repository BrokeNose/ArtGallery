package com.main.artgallery.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.service.HomeService;

@Controller
public class HomeController {
	@Autowired
	private HomeService hService;
	@RequestMapping(value = "/home.do")
	public ModelAndView home(HttpServletRequest request, ModelAndView mView) {
		
		String rPath = request.getSession().getServletContext().getRealPath("/upload");
		System.out.println(rPath);
		
		hService.getToday(request, mView);
		hService.getListA(request, mView);
		hService.getListM(request, mView);
		hService.getListP(request, mView);
		mView.setViewName("home");
		return mView;
	}
	
	@RequestMapping("/admin/home.do")
	public String adminHome(HttpServletRequest request) {
		return "redirect:/admin/art/list.do";
	}
	
	@RequestMapping("/admin")
	public String adminHome2(HttpServletRequest request) {
		return "redirect:/admin/art/list.do";
	}
}
