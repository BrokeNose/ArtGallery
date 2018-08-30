package com.main.artgallery.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.artgallery.config.dao.ConfigDao;
import com.main.artgallery.config.dto.ConfigDto;

@Service
public class ConfigServiceImpl implements ConfigService {
	@Autowired
	private ConfigDao dao;
	
	@Override
	public void getData(HttpServletRequest request, String code) {
		ConfigDto dto=dao.getData(code);	
		
		String realPath=null;
		String httpPath=null;
		String DBip=dto.getIp();
		
//		String ip=request.getRemoteAddr();		
//		System.out.println("dbip : " + DBip + "/ client ip : " + ip);
//		if(ip.equals(DBip)) {
//			DBip="localhost";
//		}
//		
		if (DBip.equals("localhost") ) {
			// local 경로
			realPath=request.getSession().getServletContext().getRealPath(dto.getUploadRoot());
			httpPath="";
		} else {
			// server 경로
			realPath="\\\\"+dto.getIp()+dto.getUploadRoot();
			httpPath="http://"+dto.getIp()+":8888/";
		}
		dto.setRealPath(realPath);
		dto.setHttpPath(httpPath);
		
		request.setAttribute("configDto", dto);
		// final string 은 dto에 담기지 않으므로  view jsp 페이지에서 사용할 경우 넣어줘야 한다.
		request.setAttribute("separator1", dto.Separator1);
		request.setAttribute("separator2", dto.Separator2);
	}

}
