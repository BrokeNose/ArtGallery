package com.main.artgallery.category.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.artgallery.category.dto.CategoryDto;

@Repository
public class CategoryDaoImpl implements CategoryDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<CategoryDto> AGetList(CategoryDto Adto) {
		List<CategoryDto> Alist=session.selectList("?",Adto);
		return Alist;
	}

	@Override
	public List<CategoryDto> PGetList(CategoryDto Pdto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CategoryDto> MGetList(CategoryDto Mdto) {
		// TODO Auto-generated method stub
		return null;
	}

}
