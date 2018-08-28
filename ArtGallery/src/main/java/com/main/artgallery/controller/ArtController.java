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

import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.favorart.dto.FavorArtDto;
import com.main.artgallery.service.ArtService;
import com.main.artgallery.service.ConfigService;
import com.main.artgallery.service.FavorArtService;


@Controller
public class ArtController {
	@Autowired
	private ArtService aService;		// ArtService에서 T_ArtRel도 함께 관리합니다.
	
	@Autowired
	private ConfigService cService;
	
	@Autowired
	private FavorArtService fService;
	
	
	//-------- Hyung ----------------------
	
	//작품 상세 정보 조회
	@RequestMapping("/art/detail")
	public ModelAndView artDetail(HttpServletRequest request, ModelAndView mView, @ModelAttribute ArtDto dto) {
		request.setAttribute("adminMode", "N");		//관리자모드 아님
		aService.getData(request, mView, dto);
		mView.setViewName("category/artDetail");
		return mView;
	}
	//관심 작품 등록,삭제 처리
	@RequestMapping("/art/favoriteArt")
	@ResponseBody
	public Map<String, Object> authFavoriteArt(HttpServletRequest request,  @RequestParam int seq) {
		fService.update(request);		
		String isFavor=(String)request.getAttribute("isFavor");		
		Map<String, Object> map=new HashMap<>();
		map.put("isFavor", isFavor);
		return map;
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
		request.setAttribute("adminMode", "Y");		// 관리자 모드
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
