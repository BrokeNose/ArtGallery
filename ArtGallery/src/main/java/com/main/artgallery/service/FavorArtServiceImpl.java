package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.favorart.dao.FavorArtDao;
import com.main.artgallery.favorart.dto.FavorArtDto;

@Service
public class FavorArtServiceImpl implements FavorArtService {
	@Autowired
	private FavorArtDao dao; 
	@Autowired
	
		
	@Override
	public void getList(ModelAndView mView, ArtDto dto, FavorArtDto FAdto) {
		/*mView.addObject("totalRow", dao.getCount(dto));	//관심 작품 몇개인지 나타내기	*/
		mView.addObject("list", dao.getList(dto));		
	}

	@Override
	public void getData(HttpServletRequest request, ModelAndView mView, FavorArtDto dto) {
		mView.addObject("dto", dao.getData(dto));		
	}

	@Override
	public void update(HttpServletRequest request, FavorArtDto dto) {
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
