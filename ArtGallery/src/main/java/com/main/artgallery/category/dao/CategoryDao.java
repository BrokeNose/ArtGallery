package com.main.artgallery.category.dao;

import java.util.List;

import com.main.artgallery.category.dto.CategoryDto;

public interface CategoryDao {
	public List<CategoryDto> AGetList(CategoryDto Adto);
	public List<CategoryDto> PGetList(CategoryDto Pdto);
	public List<CategoryDto> MGetList(CategoryDto Mdto);
}
