package com.main.artgallery.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.main.artgallery.user.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService uSerivce;
	
}
