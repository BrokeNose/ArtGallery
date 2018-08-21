package com.main.artgallery;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value = "/home.do")
//	public String home(HttpServletRequest request) {
//		String rPath = request.getSession().getServletContext().getRealPath("/upload");
//		System.out.println(rPath);
	public String home(HttpServletRequest request) {	
		return "home";
	}
}
