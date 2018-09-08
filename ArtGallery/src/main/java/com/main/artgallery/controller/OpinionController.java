package com.main.artgallery.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.opinion.dto.OpinionCommentDto;
import com.main.artgallery.service.OpinionService;

@Controller
public class OpinionController {
	@Autowired
	private OpinionService opinionService;
	
	// --- 서비스 -----
	//글 수정 요청 처리
	@RequestMapping("/opinion/update")
	@ResponseBody
	public Map<String, Object> userUpdate(HttpServletRequest request) {
		opinionService.update(request);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	
	//글 수정 폼 요청처리
	@RequestMapping("/opinion/updateform")
	public ModelAndView userUpdateForm(HttpServletRequest request){
		request.setAttribute("adminMode", "N");
		opinionService.detail(request);
		
		return new ModelAndView("opinion/updateform");
	}
	
	
	//글 삭제 요청 처리
	@RequestMapping("/opinion/delete")
	@ResponseBody
	public Map<String, Object> userDelete(HttpServletRequest request) {
		opinionService.delete(request);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	
	//글 자세히 보기 요청 처리
	@RequestMapping("/opinion/detail")
	public ModelAndView userDetail(HttpServletRequest request) {
		request.setAttribute("adminMode", "N");
		opinionService.detail(request);
		return new ModelAndView("opinion/detail");
	}
	
	
	//새글 저장 요청 처리
	@RequestMapping("/opinion/insert")
	@ResponseBody
	public Map<String, Object> userInsert(HttpServletRequest request) {
		opinionService.insert(request);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}
	
	
	//새글 작성 폼 요청 처리
	@RequestMapping("/opinion/insertform")
	public ModelAndView userInsertform(HttpServletRequest request) {	
		return new ModelAndView("opinion/insertform");
	}
	
	//카페 글 목록 보기 요청 처리 
	@RequestMapping("/opinion/list")
	public ModelAndView userlist(HttpServletRequest request) {
		request.setAttribute("adminMode", "N");
		opinionService.getList(request);
		return new ModelAndView("opinion/list");
	}
	
	//카페 글 목록 보기 요청 처리 
	@RequestMapping("/opinion/count.do")
	@ResponseBody
	public Map<String, Object> getCount(HttpServletRequest request) {		
		opinionService.getCountNoView(request);
		int opinionCount=(int)request.getAttribute("opinionCount");
		Map<String, Object> map=new HashMap<>();
		map.put("opinionCount", opinionCount);
		return map;
	}
	
	// ------  관리자 ----------------
	//글 자세히 보기 요청 처리
	@RequestMapping("/admin/opinion/detail")
	public ModelAndView adminOpinionDetail(HttpServletRequest request) {
		request.setAttribute("adminMode", "Y");
		opinionService.detail(request);
		return new ModelAndView("admin/opinion/detail");
	}
	
	
	//카페 글 목록 보기 요청 처리 
	@RequestMapping("/admin/opinion/list")
	public ModelAndView adminOpinionlist(HttpServletRequest request) {
		request.setAttribute("adminMode", "Y");
		opinionService.getList(request);
		return new ModelAndView("admin/opinion/list");
	}
	
	//새 댓글 저장 요청처리
	@RequestMapping("/admin/opinion/comment_insert")
	public ModelAndView adminCommentInsert
		(HttpServletRequest request , @ModelAttribute OpinionCommentDto dto) {
		
		opinionService.commentInsert(dto);;
		
		return new ModelAndView("redirect:/admin/opinion/detail.do?num="+dto.getRef_group());
	}
	

}
