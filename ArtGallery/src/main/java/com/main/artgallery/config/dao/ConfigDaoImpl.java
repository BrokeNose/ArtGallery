package com.main.artgallery.config.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.artgallery.config.dto.ConfigDto;

@Repository
public class ConfigDaoImpl implements ConfigDao {
	@Autowired
	private SqlSession session;

	@Override
	public ConfigDto getData(String code) {
		return session.selectOne("config.getData", code);
	}

}
