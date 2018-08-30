package com.main.artgallery.category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.artgallery.art.dto.ArtRelDto;
import com.main.artgallery.category.dto.CategoryDto;
/*
 * Son
 * list 출력 dao 생성
 */
@Repository
public class CategoryDaoImpl implements CategoryDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<CategoryDto> AGetList() {
		return session.selectList("category.getListArtist");
	}

	@Override
	public List<CategoryDto> PGetList() {
		return session.selectList("category.getListArtistPart");
	}

	@Override
	public List<CategoryDto> MGetList() {
		return session.selectList("category.getListMaterial");
	}

	@Override
	public CategoryDto getDataArtist(int seq) {
		return session.selectOne("category.getDataArtist",seq);
	}

	@Override
	public CategoryDto getDataMaterial(int seq) {
		return session.selectOne("category.getDataMaterial",seq);
	}

	@Override
	public CategoryDto getDataArtistPart(int seq) {
		return session.selectOne("category.getDataArtistPart",seq);
	}

	@Override
	public void insert(CategoryDto dto) {
		session.insert("category.insert",dto);
		
	}


	@Override
	public void update(int seq) {
		session.update("category.update",seq);
		
	}

	@Override
	public void delete(int seq) {
		session.delete("category.delete",seq);
		
	}

	//Son 작업중...
	@Override
	public List<CategoryDto> getList(String code) {
		
		return session.selectList("category.getList", code);
	}

	@Override
	public List<CategoryDto> getFavorList() {
		return null;
	}
	
	@Override
	public CategoryDto getAData(int seq) {
		return session.selectOne("category.getDataAll",seq);
	}

	
	

	
	
	public List<CategoryDto> getSearchList(CategoryDto dto) {
		return session.selectList("category.getSearchList", dto);
	}

	@Override
	public void getCount(int count) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CategoryDto> getListCategory(CategoryDto dto) {
		// TODO Auto-generated method stub
		return session.selectList("category.getListCategory", dto);
	}
	
	@Override
	public CategoryDto getDataSeq(int seq) {
		// TODO Auto-generated method stub
		return session.selectOne("category.getDataSeq", seq);
	}

	@Override
	public List<CategoryDto> getListRelation(ArtRelDto dto) {
		
		return session.selectList("category.getListRelation", dto);
	}
		
}
