package com.main.artgallery.category.dao;

import java.util.List;

import com.main.artgallery.art.dto.ArtRelDto;
import com.main.artgallery.category.dto.CategoryDto;

public interface CategoryDao {
	public List<CategoryDto> AGetList();
	public List<CategoryDto> PGetList();
	public List<CategoryDto> MGetList();
	public CategoryDto getDataArtist(int seq);
	public CategoryDto getDataMaterial(int seq);
	public CategoryDto getDataArtistPart(int seq);
	public void insert(CategoryDto dto);
	public void update(int seq);
	public void delete(int seq);
	
	// Shin
	public List<CategoryDto> getListCategory(CategoryDto dto);

	//Son
	public List<CategoryDto> getList(String code);
	public List<CategoryDto> getFavorList();
	public CategoryDto getAData(int seq);
	public void getCount(int count);
	
	//hyung
	public List<CategoryDto> getSearchList(CategoryDto dto);	// 카테고리 검색어 검색
}
