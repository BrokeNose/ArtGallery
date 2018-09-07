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
		// request 에 글 하나의 정보가 담기게 한다. 
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
	
	//새 댓글 저장 요청처리
	@RequestMapping("/opinion/comment_insert")
	public ModelAndView userCommentInsert
		(HttpServletRequest request , @ModelAttribute OpinionCommentDto dto) {
		
		opinionService.commentInsert(dto);;
		
		return new ModelAndView
			("redirect:/opinion/detail.do?num="+dto.getRef_group());
	}
	
	//글 자세히 보기 요청 처리
	@RequestMapping("/opinion/detail")
	public ModelAndView detail(HttpServletRequest request) {
		//서비스 객체를 이용해서 글 자세히 보기에 관련된
		//Model 이 request 에 담기게 하고 
		request.setAttribute("adminMode", "N");
		opinionService.detail(request);
		//view 페이지로 forward 이동해서 응답하기 
		return new ModelAndView("opinion/detail");
	}
	
	
	//새글 저장 요청 처리
	@RequestMapping("/opinion/insert")
	@ResponseBody
	public Map<String, Object> userInsert(HttpServletRequest request) {
		//서비스 객체를 이용해서 새글을 저장하고
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
		//인자로 전달받은 HttpServletRequest 객체를 서비스에 전달해서
		//비즈니스 로직을 수행하고 
		//view 페이지에서 필요한 데이터가 request 영역에 담기게 한다.
		request.setAttribute("adminMode", "N");
		opinionService.getList(request);
		//view 페이지로 forward 이동
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
}
