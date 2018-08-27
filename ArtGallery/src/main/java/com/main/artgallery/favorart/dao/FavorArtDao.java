package com.main.artgallery.favorart.dao;

import java.util.List;

import com.main.artgallery.favorart.dto.FavorArtDto;

public interface FavorArtDao {
	public List<FavorArtDto> getList(FavorArtDto dto);
	public int getCount(FavorArtDto dto);
	public void insert(FavorArtDto dto);
	public FavorArtDto getData(FavorArtDto dto);
	public void update(FavorArtDto dto);
	public void delete(int seq);
}
