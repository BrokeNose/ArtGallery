package com.main.artgallery.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.service.UserService;
import com.main.artgallery.user.dto.UserDto;

@Controller
public class UserController {
	@Autowired
	private UserService uService;
	@RequestMapping("/admin/user/userlist")
	public ModelAndView adminGetList(HttpServletRequest request, ModelAndView mView, UserDto dto) {
		uService.getList(request, mView, dto);
		mView.setViewName("admin/user/userlist");
		return mView;
	}
	@RequestMapping("/user/signup_form")
	public String signup_form() {
		return "user/signup_form";
	}
	@RequestMapping("/user/checkid")
	@ResponseBody
	public Map<String, Object> checkId(@RequestParam String inputId) {
		boolean canUse=uService.canUseId(inputId);
		Map<String, Object> map=new HashMap<>();
		map.put("canUse", canUse);
		return map;
	}
	@RequestMapping("/user/signup")
	@ResponseBody
	public Map<String, Object> signup(@ModelAttribute UserDto dto) {
		boolean signupSuccess=uService.signUp(dto);
		Map<String, Object> map=new HashMap<>();
		map.put("signupSuccess", signupSuccess);
		map.put("msg", "회원가입 완료!");
		return map;
	}
	@RequestMapping("/user/signin_form")
	public ModelAndView signin_form(@RequestParam(defaultValue="") String url, HttpServletRequest request) {
		if(url.equals("")) {
			url=request.getContextPath()+"/";
		}
		ModelAndView mView=new ModelAndView();
		mView.addObject("url", url);
		mView.setViewName("user/signin_form");
		return mView;
	}
	@RequestMapping("/user/signin")
	public ModelAndView signin(@ModelAttribute UserDto dto, @RequestParam String url, HttpSession session) {
		ModelAndView mView=new ModelAndView();
		uService.signIn(mView, dto, session);
		mView.addObject("url", url);
		mView.setViewName("user/signin");
		return mView;
	}
	@RequestMapping("/user/signout")
	public String userSignout(HttpSession session) {
		session.invalidate();
		return "user/signout";
	}
	@RequestMapping("/user/info")
	public ModelAndView userInfo(HttpServletRequest request, HttpSession session) {
		ModelAndView mView=new ModelAndView();
		uService.info(mView, session);
		mView.setViewName("user/info");
		return mView;
	}
	@RequestMapping("/user/update_form")
	public ModelAndView userUpdateForm(HttpServletRequest request, HttpSession session) {
		ModelAndView mView=new ModelAndView();
		uService.updateForm(mView, session);
		mView.setViewName("user/update_form");
		return mView;
	}
	@RequestMapping("/user/update")
	public ModelAndView userUpdate(HttpServletRequest request, @ModelAttribute UserDto dto) {
		uService.update(dto);
		return new ModelAndView("redirect:/user/info.do");
	}
	@RequestMapping("/user/pw_change_form")
	public ModelAndView userPwdUpdateForm(HttpServletRequest request) {
		return new ModelAndView("user/pw_change_form");
	}
	@RequestMapping("/user/pw_check")
	@ResponseBody
	public Map<String, Object> pwdCheck(@RequestParam String inputPwd, HttpSession session) {
		boolean isValid=uService.isValidPwd(inputPwd, session);
		Map<String, Object> map=new HashMap<>();
		map.put("isValid", isValid);
		return map;
	}
	@RequestMapping("/user/pw_change")
	public ModelAndView userPwdChange(HttpServletRequest request, @RequestParam String pwd, HttpSession session) {
		uService.changePwd(pwd, session);
		return new ModelAndView("redirect:/user/info.do");
	}
	@RequestMapping("/user/leave")
	public ModelAndView userLeave(HttpServletRequest request, ModelAndView mView) {
		uService.leave(mView, request.getSession());
		mView.setViewName("user/leave");
		return mView;
	}
	@RequestMapping("/admin/user/delete")
	public ModelAndView adminDelete(HttpServletRequest request, ModelAndView mView) {
		uService.delete(mView, request.getSession());
		return mView;
	}
}
