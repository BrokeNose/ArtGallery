package com.main.artgallery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.main.artgallery.category.dao.CategoryDao;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	CategoryDao categoryDao;
	@Override
	public void getToday() {
		
	}
	@Override
	public void getListA() {
		
	}
	@Override
	public void getListM() {
		
	}
	@Override
	public void getListP() {
		
	}
}
