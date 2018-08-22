package com.main.artgallery.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.user.dao.UserDao;
import com.main.artgallery.user.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao dao;
	@Override
	public void getList(HttpServletRequest request, ModelAndView mView, UserDto dto) {
		String keyword=request.getParameter("keyword");
		String condition=request.getParameter("condition");
		if(keyword!=null) {
			if(condition.equals("id")) {
				dto.setId(keyword);
			} else if(condition.equals("email")) {
				dto.setEmail(keyword);
			}
			mView.addObject("keyword", keyword);
			mView.addObject("condition", condition);
		}
		List<UserDto> list=dao.getList(dto);
		mView.addObject("list", list);
	}
	@Override
	public boolean canUseId(String id) {
		return dao.canUseId(id);
	}	
	@Override
	public void signUp(ModelAndView mView, UserDto dto) {
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(dto.getPwd());
		dto.setPwd(encodedPwd);
		dao.insert(dto);
		mView.addObject("msg", dto.getId()+" 회원님 가입됐습니다.");
	}
	@Override
	public void signIn(ModelAndView mView, UserDto dto, HttpSession session) {
		UserDto resultDto=dao.getData(dto.getId());
		boolean isSigninSuccess=false;
		if(resultDto!=null) {
			isSigninSuccess=BCrypt.checkpw(dto.getPwd(), resultDto.getPwd());
		}
		if(isSigninSuccess) {
			session.setAttribute("id", dto.getId());
		}
		mView.addObject("isSigninSuccess", isSigninSuccess);
	}
	@Override
	public void info(ModelAndView mView, HttpSession session) {
		String id=(String)session.getAttribute("id");
		UserDto dto=dao.getData(id);
		mView.addObject("dto", dto);
	}
	@Override
	public void updateForm(ModelAndView mView, HttpSession session) {
		String id=(String)session.getAttribute("id");
		UserDto dto=dao.getData(id);
		mView.addObject("dto", dto);
	}
	@Override
	public void update(UserDto dto) {
		dao.update(dto);
	}
	@Override
	public boolean isValidPwd(String inputPwd, HttpSession session) {
		String id=(String)session.getAttribute("id");
		UserDto dto=dao.getData(id);
		boolean isValid=BCrypt.checkpw(inputPwd, dto.getPwd());
		return isValid;
	}
	@Override
	public void changePwd(String pwd, HttpSession session) {
		String id=(String)session.getAttribute("id");
		BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
		String encodedPwd=encoder.encode(pwd);
		UserDto dto=new UserDto();
		dto.setId(id);
		dto.setPwd(encodedPwd);
		dao.changePwd(dto);
	}
	@Override
	public void leave(ModelAndView mView, HttpSession session) {
		String id=(String)session.getAttribute("id");
		dao.leave(id);
		session.invalidate();
		mView.addObject("msg", id+" 회원님 탈퇴됐습니다.");
	}
	@Override
	public void delete(ModelAndView mView, HttpSession session) {
		String id=(String)session.getAttribute("id");
		dao.delete(id);
	}
}
