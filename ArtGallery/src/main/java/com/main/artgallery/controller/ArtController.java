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
import com.main.artgallery.service.ConfigService;


@Controller
public class ArtController {
	@Autowired
	private ArtService aService;		// ArtService에서 T_ArtRel도 함께 관리합니다.
	
	@Autowired
	private ConfigService cService;
	
	//-------- Son ----------------------

	
	
	
	
	//-------- Hyung ----------------------
	
	//작품 상세 정보 조회
	@RequestMapping("/artDetail")
	public ModelAndView artDetail(HttpServletRequest request, ModelAndView mView, @ModelAttribute ArtDto dto) {
		request.setAttribute("adminMode", "N");
		aService.getData(request, mView, dto);
		mView.setViewName("category/artDetail");
		return mView;
	}
	
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
		aService.getList(mView, dto);
		mView.setViewName("admin/art/list");
		return mView;
	}
	//관리자 작품 등록화면
	@RequestMapping("/admin/art/insertform")
	public ModelAndView adminArtInsertform(HttpServletRequest request) {
		request.setAttribute("adminMode", "Y");
		cService.getData(request, "1");
		return new ModelAndView("admin/art/insertform");
	}
	//관리자 작품 등록처리
	@RequestMapping("/admin/art/insert")
	public ModelAndView adminArtInsert(HttpServletRequest request, @ModelAttribute ArtDto dto) {
		aService.insert(request, dto);
		
		String param="pageNum=1"
		+"&searchKeyword="+request.getParameter("searchKeyword")
		+"&searchCondition="+request.getParameter("searchCondition");
		
		return new ModelAndView("redirect:/admin/art/list.do?"+param);
	}
	//관리자 작품 수정화면
	@RequestMapping("/admin/art/updateform")
	public ModelAndView adminArtUpdateform(HttpServletRequest request, ModelAndView mView, @ModelAttribute ArtDto dto) {
		aService.getData(request, mView, dto);
		mView.setViewName("admin/art/updateform");
		return mView;
	}
	//관리자 작품 수정처리
	@RequestMapping("/admin/art/update")
	public ModelAndView adminArtUpdate(HttpServletRequest request, @ModelAttribute ArtDto dto) {
		aService.update(request, dto);
		
		String param="pageNum="+request.getParameter("pageNum")
					+"&searchKeyword="+request.getParameter("searchKeyword")
					+"&searchCondition="+request.getParameter("searchCondition");
		return new ModelAndView("redirect:/admin/art/list.do?"+param);
	}
	//관리자 작품 삭제처리
	@RequestMapping("/admin/art/delete")
	public ModelAndView adminArtDelete(HttpServletRequest request, @RequestParam int seq) {
		aService.delete(request, seq);
		
		String param="pageNum="+request.getParameter("pageNum")
					+"&searchKeyword="+request.getParameter("searchKeyword")
					+"&searchCondition="+request.getParameter("searchCondition");
		return new ModelAndView("redirect:/admin/art/list.do?"+param);
	}
}
