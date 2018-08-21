package com.main.artgallery.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.user.dto.UserDto;
import com.main.artgallery.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService uService;
	
	@RequestMapping("/admin/userlist")
	public ModelAndView list() {
		ModelAndView mView=new ModelAndView();
		UserDto dto=new UserDto();		
		uService.list(mView, dto);
		// 뷰페이지의 정보 설정 
		mView.setViewName("admin/userlist");
		return mView;
	}
	
}
