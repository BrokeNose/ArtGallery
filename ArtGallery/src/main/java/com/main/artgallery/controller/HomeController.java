package com.main.artgallery.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value = "/home.do")
	public String home(HttpServletRequest request) {
		String rPath = request.getSession().getServletContext().getRealPath("/upload");
		System.out.println(rPath);
//	public String home() {	
		return "home";
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
