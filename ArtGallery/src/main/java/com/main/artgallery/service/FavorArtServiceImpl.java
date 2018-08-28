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
	public void update(HttpServletRequest request) {
		
		String id=(String)request.getSession().getAttribute("id");		
		int seq=Integer.parseInt(request.getParameter("seq"));
		FavorArtDto dto=new FavorArtDto();
		dto.setAseq(seq);
		dto.setId(id);
		
		FavorArtDto dto2 = dao.getData(dto);
		if (  dto2 != null && dto2.getId() != null) {
			//System.out.println("favorite delete");
			request.setAttribute("isFavor", "N");
			dao.delete(dto);
		} else {
			//System.out.println("favorite insert");
			dao.insert(dto);
			request.setAttribute("isFavor", "Y");
		}
	}
}
