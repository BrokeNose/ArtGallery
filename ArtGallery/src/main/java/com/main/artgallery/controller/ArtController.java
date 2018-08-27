package com.main.artgallery.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.service.ArtService;


@Controller
public class ArtController {
	@Autowired
	private ArtService aService;		// ArtService에서 T_ArtRel도 함께 관리합니다.
	
	
	//-------- Son ----------------------

	
	
	
	
	//-------- Hyung ----------------------
	// 임시 로그인 처리
	@RequestMapping("/loginAuto")
	public String loginAuto(HttpSession session, @RequestParam String id) {
		session.setAttribute("id", id);
		if(id.equals("hyung")) {
			session.setAttribute("roll", "A");
		}else {
			session.setAttribute("roll", "U");
		}
		return "redirect:/home.do";
	}
	
	//관리자 작품 목록
	@RequestMapping("/admin/art/list")
	public ModelAndView adminArtList(HttpServletRequest request, ModelAndView mView, @ModelAttribute ArtDto dto) {
		aService.getConfig(request);
		aService.getList(mView, dto);
		mView.setViewName("admin/art/list");
		return mView;
	}
	//관리자 작품 등록화면
	@RequestMapping("/admin/art/insertform")
	public ModelAndView adminArtInsertform(HttpServletRequest request) {
		aService.getConfig(request);
		return new ModelAndView("admin/art/insertform");
	}
	//관리자 작품 등록처리
	@RequestMapping("/admin/art/insert")
	public ModelAndView adminArtInsert(HttpServletRequest request, @ModelAttribute ArtDto dto) {
		aService.insert(request, dto);
		return new ModelAndView("redirect:/admin/art/list.do");
	}
	//관리자 작품 수정화면
	@RequestMapping("/admin/art/updateform")
	public ModelAndView adminArtUpdateform(HttpServletRequest request, ModelAndView mView, @ModelAttribute ArtDto dto) {
		aService.getConfig(request);
		aService.getData(mView, dto);
		mView.setViewName("admin/art/updateform");
		return mView;
	}
	//관리자 작품 수정처리
	@RequestMapping("/admin/art/update")
	public ModelAndView adminArtUpdate(HttpServletRequest request, @ModelAttribute ArtDto dto) {
		aService.update(request, dto);
		return new ModelAndView("redirect:/admin/art/list.do");
	}
	//관리자 작품 삭제처리
	@RequestMapping("/admin/art/delete")
	public ModelAndView adminArtDelete(HttpServletRequest request, @RequestParam int seq) {
		aService.delete(request, seq);
		return new ModelAndView("redirect:/admin/art/list.do");
	}
}
