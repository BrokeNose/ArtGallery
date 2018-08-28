package com.main.artgallery.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dao.ArtRelDao;
import com.main.artgallery.art.dto.ArtRelDto;
import com.main.artgallery.category.dao.CategoryDao;
import com.main.artgallery.category.dto.CategoryDto;
import com.main.artgallery.config.dao.ConfigDao;
import com.main.artgallery.config.dto.ConfigDto;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDao dao;
	
	@Autowired
	private ConfigDao configDao;
	
	@Autowired
	private ArtRelDao arDao;

	private ConfigDto configDto=null;
	
	@Override
	public void getList(HttpServletRequest request,ModelAndView mView) {
		String categoryType=(String)request.getParameter("categorytype");
		
		if (categoryType==null) {
			mView.addObject("list",dao.AGetList());
			mView.addObject("categoryType", "A");
		}else if(categoryType.equals("A")) {
			mView.addObject("list",dao.AGetList());
			mView.addObject("categoryType", "A");
		}else if(categoryType.equals("M")) {
			mView.addObject("list",dao.MGetList());
			mView.addObject("categoryType", "M");
		}else if(categoryType.equals("P")) {
			mView.addObject("list",dao.PGetList());
			mView.addObject("categoryType", "P");
		}
	}
	
	//son
	@Override
	public void SonGetList(HttpServletRequest request, ModelAndView mView) {
		//T_config 환경변수 가져오기
		getConfig();
		mView.addObject("configDto", configDto);
		String SonCategoryType=(String)request.getParameter("soncategorytype");
		
		if (SonCategoryType==null) {
			SonCategoryType="A";
		}
		mView.addObject("list",dao.getList(SonCategoryType));
		mView.addObject("SonCategoryType", SonCategoryType);
		
	}
	
	@Override
	public void SonGetData(HttpServletRequest request, ModelAndView mView) {
		//T_config 환경변수 가져오기
		getConfig();
		
		
		//파라미터로 전달되는 글번호 읽어오기
		int seq=Integer.parseInt(request.getParameter("seq"));
		
		CategoryDto dto= new CategoryDto();
		
		mView.addObject("list",arDao.getArtList(seq));
		dto=dao.getAData(seq);
		/*if (dto.getCode().equals("A")) {
			mView.addObject("list",dao.getAList());
			mView.addObject("SonCategoryType", "A");
		}else if(dto.getCode().equals("M")) {
			mView.addObject("list",dao.getAList());
			mView.addObject("SonCategoryType", "A");
		}else if() {
			
		}*/
		mView.addObject("configDto", configDto);
		mView.addObject("dto", dto);
		mView.addObject("list",arDao.getArtList(seq));
	}

	
	@Override
	public void getSearchList(HttpServletRequest request, ModelAndView mView) {
		//T_config 환경변수 가져오기
		getConfig();
				
		CategoryDto dto=new CategoryDto();
		dto.setCode(request.getParameter("code"));
		if (request.getParameter("keyword") != null ){
			dto.setName(request.getParameter("keyword"));
		}
		//request에 담아야 controller에서 읽어서 json 처리 할 수 있음
		request.setAttribute("list",  dao.getSearchList(dto));	
	}

	@Override
	public void getConfig() {
		configDto=configDao.getData("1");
	}

	
	
}

	
