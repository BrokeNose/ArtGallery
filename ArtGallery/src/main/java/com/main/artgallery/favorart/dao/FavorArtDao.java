package com.main.artgallery.favorart.dao;

import java.util.List;

import com.main.artgallery.art.dto.ArtDto;
import com.main.artgallery.favorart.dto.FavorArtDto;

public interface FavorArtDao {
	public List<ArtDto> getList(FavorArtDto dto);
	public int getCount(FavorArtDto dto);
	public FavorArtDto getData(FavorArtDto dto);
	public void insert(FavorArtDto dto);
	public void delete(FavorArtDto dto);
	public ArtDto getDataPrevNext(FavorArtDto dto);
}
