package com.main.artgallery.art.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.artgallery.art.dto.ArtRelDto;

/*
 * 작성자 : hyung
 * 비고 : 
 */

@Repository
public class ArtRelDaoImpl implements ArtRelDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<ArtRelDto> getList(ArtRelDto dto) {
		return session.selectList("artRel.getList", dto);
	}

	@Override
	public void insert(ArtRelDto dto) {
		session.insert("artRel.insert", dto);
	}

	@Override
	public void delete(int seq) {
		session.delete("artRel.delete", seq);
	}
//	Son---------------------------------------------------
	@Override
	public List<ArtRelDto> getArtList(int seq) {
		
		return session.selectList("artRel.artGetList", seq);
	}

}
