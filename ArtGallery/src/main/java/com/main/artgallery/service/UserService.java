package com.main.artgallery.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.user.dto.UserDto;

public interface UserService {
	public boolean canUseId(String id);
	public void signUp(ModelAndView mView, UserDto dto);
	public void signIn(ModelAndView mView, UserDto dto, HttpSession session);
	public void info(ModelAndView mView, HttpSession session);
	public void updateForm(ModelAndView mView, HttpSession session);
	public void update(UserDto dto);
	public boolean isValidPwd(String inputPwd, HttpSession session);
	public void changePwd(String pwd, HttpSession session);
	public void delete(ModelAndView mView, HttpSession session);
	public void list(ModelAndView mView, UserDto dto);
}
