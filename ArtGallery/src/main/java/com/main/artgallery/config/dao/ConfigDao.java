package com.main.artgallery.config.dao;

import com.main.artgallery.config.dto.ConfigDto;

public interface ConfigDao {
	public ConfigDto getData(String code);
}
