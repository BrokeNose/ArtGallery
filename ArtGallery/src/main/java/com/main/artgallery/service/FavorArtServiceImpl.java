package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.main.artgallery.config.dao.ConfigDao;
import com.main.artgallery.config.dto.ConfigDto;
import com.main.artgallery.favorart.dao.FavorArtDao;
import com.main.artgallery.favorart.dto.FavorArtDto;

@Service
public class FavorArtServiceImpl implements FavorArtService {
	@Autowired
	private FavorArtDao dao; 
	@Autowired
	private ConfigDao configDao;
	
	private ConfigDto configDto=null;
	
		
	@Override
	public void getList(ModelAndView mView, HttpServletRequest request) {
		getConfig();
		mView.addObject("configDto", configDto);
		/*mView.addObject("totalRow", dao.getCount(dto));	//관심 작품 몇개인지 나타내기	*/
		/*ArtDto dto= new ArtDto();*/
		String id=(String)request.getSession().getAttribute("id");
		FavorArtDto FAdto=new FavorArtDto();
		FAdto.setId(id);
		mView.addObject("list", dao.getList(FAdto));		
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
	
	@Override
	public void getConfig() {
		configDto=configDao.getData("1");
	}
}
