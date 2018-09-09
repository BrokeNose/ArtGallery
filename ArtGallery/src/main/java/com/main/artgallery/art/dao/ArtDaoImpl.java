package com.main.artgallery.art.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.category.dto.CategoryDto;

/*
 * 작성자 : hyung
 * 비고 : 
 */

@Repository
public class ArtDaoImpl implements ArtDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ArtDto> getList(ArtDto dto) {
		return session.selectList("art.getList", dto);
	}

	@Override
	public int getCount(ArtDto dto) {
		return session.selectOne("art.getCount", dto);
	}

	@Override
	public void insert(ArtDto dto) {
		session.insert("art.insert", dto);
	}

	@Override
	public ArtDto getData(ArtDto dto) {
		return session.selectOne("art.getData", dto);
	}

	@Override
	public void update(ArtDto dto) {
		session.update("art.update", dto);
	}

	@Override
	public void delete(int seq) {
		session.delete("art.delete", seq);
	}

	@Override
	public int getSequence() {
		return session.selectOne("art.getSequence");
	}

//	-------------------son--------------------------
	@Override
	public List<ArtDto> getArtList(ArtDto dto) {
		return session.selectList("art.getListAll", dto);
	}

	@Override
	public void addViewCount(int seq) {
		session.update("art.addViewCount", seq);
	}

	@Override
	public List<ArtDto> getSearchList(String SearchKeyword) {
		
		return session.selectList("search.mainSearchList",SearchKeyword);
	}

	@Override
	public CategoryDto getSearchCategory(String SearchKeyword) {
		
		return session.selectOne("search.mainSearchCategory", SearchKeyword);
	}

	@Override
	public ArtDto getSearchData(ArtDto dto) {
		return session.selectOne("search.mainSearchData", dto);
	}
}
