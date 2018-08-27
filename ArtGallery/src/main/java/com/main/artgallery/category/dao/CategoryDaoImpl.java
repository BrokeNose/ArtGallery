package com.main.artgallery.category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public void insertArtist(CategoryDto dto) {
		session.insert("category.insertArtist",dto);
		
	}

	@Override
	public void insertMaterial(CategoryDto dto) {
		session.insert("category.insertMaterial",dto);
		
	}

	@Override
	public void insertArtistPart(CategoryDto dto) {
		session.insert("category.insertArtistPart",dto);
		
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
	public List<CategoryDto> getAList() {
		
		return session.selectList("category.getAList");
	}

	@Override
	public List<CategoryDto> getPList() {
		return session.selectList("category.getPList");
	}

	@Override
	public List<CategoryDto> getMList() {
		return session.selectList("category.getMList");
	}

	@Override
	public List<CategoryDto> getFavorList() {
		// TODO Auto-generated method stub
		return null;
	}

	

	
	
	public List<CategoryDto> getSearchList(CategoryDto dto) {
		return session.selectList("category.getSearchList", dto);
	}

	@Override
	public void getCount(int count) {
		// TODO Auto-generated method stub
		
	}
		
}
