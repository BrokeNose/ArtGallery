package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.favorart.dao.FavorArtDao;
import com.main.artgallery.favorart.dto.FavorArtDto;

@Service
public class FavorArtServiceImpl implements FavorArtService {
	@Autowired
	private FavorArtDao dao; 
		
	@Override
	public void getList(ModelAndView mView, FavorArtDto dto) {
		mView.addObject("totalRow", dao.getCount(dto));		
		mView.addObject("list", dao.getList(dto));		
	}

	@Override
	public void getData(HttpServletRequest request, ModelAndView mView, FavorArtDto dto) {
		mView.addObject("dto", dao.getData(dto));		
	}

	@Override
	public void update(HttpServletRequest request, FavorArtDto dto) {
		if ( dao.getData(dto) != null && dao.getData(dto).getId() != null) {
			System.out.println("favorite delete");
			request.setAttribute("isFavor", "N");
			dao.delete(dto);
		} else {
			System.out.println("favorite insert");
			dao.insert(dto);
			request.setAttribute("isFavor", "Y");
		}
	}
}
