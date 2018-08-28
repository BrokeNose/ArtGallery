package com.main.artgallery.favorart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.favorart.dto.FavorArtDto;

@Repository
public class FavorArtDaoImpl implements FavorArtDao{
	@Autowired
	private SqlSession session;
	
	@Override
	public List<FavorArtDto> getList(ArtDto dto) {
		return session.selectList("favorArt.getList", dto);
	}

	@Override
	public int getCount(FavorArtDto dto) {
		return session.selectOne("favorArt.getCount", dto);
	}

	@Override
	public FavorArtDto getData(FavorArtDto dto) {
		return  session.selectOne("favorArt.getData", dto);
	}

	@Override
	public void insert(FavorArtDto dto) {
		session.insert("favorArt.insert", dto);		
	}

	@Override
	public void delete(FavorArtDto dto) {
		session.delete("favorArt.delete", dto);			
	}

}
