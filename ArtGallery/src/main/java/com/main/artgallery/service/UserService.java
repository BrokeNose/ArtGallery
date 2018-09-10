package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.user.dto.UserDto;

public interface UserService {
	public void getList(HttpServletRequest request, ModelAndView mView, UserDto dto);
	public boolean canUseId(String id);
	public boolean signUp(UserDto dto);
	public void signIn(ModelAndView mView, UserDto dto, HttpSession session);
	public void info(ModelAndView mView, HttpSession session);
	public void updateForm(ModelAndView mView, HttpSession session);
	public void update(UserDto dto);
	public boolean isValidPwd(String inputPwd, HttpSession session);
	public void changePwd(String pwd, HttpSession session);
	public void leave(ModelAndView mView, HttpSession session);
	public void leave2(String id);
	public void delete(String id);
	public void getConfig(HttpServletRequest request);
}
