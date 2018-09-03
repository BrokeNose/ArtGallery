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
	private ConfigService cfService;	
	private ConfigDto configDto=null;
		
	@Override
	public void getList(ModelAndView mView, HttpServletRequest request) {
		getConfig(request);
		mView.addObject("configDto", configDto);
		/*mView.addObject("totalRow", dao.getCount(dto));	//관심 작품 몇개인지 나타내기	*/
		/*ArtDto dto= new ArtDto();*/
		String id=(String)request.getSession().getAttribute("id");
		FavorArtDto FAdto=new FavorArtDto();
		FAdto.setId(id);
		mView.addObject("list", dao.getList(FAdto));		
	}

	//작품 상세 페이지 서비스. (관심작품)
	@Override
	public void getData(HttpServletRequest request, ModelAndView mView) {
		String id=(String)request.getSession().getAttribute("id");
		int seq=Integer.parseInt(request.getParameter("seq"));
		FavorArtDto dto=new FavorArtDto();
		dto.setId(id);
		dto.setAseq(seq);
		mView.addObject("dto", dao.getDataPrevNext(dto));		
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
	
	@Override
	public void getConfig(HttpServletRequest request) {
		// ConfigService 에서 가져오면 request에 담겨져 있으므로 다시 가져온다.
		cfService.getData(request, "1");
		configDto=(ConfigDto)request.getAttribute("configDto");		
	}
}
