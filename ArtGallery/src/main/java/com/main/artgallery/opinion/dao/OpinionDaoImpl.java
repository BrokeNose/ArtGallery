package com.main.artgallery.opinion.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.artgallery.opinion.dto.OpinionDto;

@Repository
public class OpinionDaoImpl implements OpinionDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(OpinionDto dto) {
		/*
		 *  Mapper namespace : opinion
		 *  sql id : insert
		 *  parameterType : opinionDto(type alias) 
		 */
		session.insert("opinion.insert", dto);
	}

	@Override
	public int getCount(OpinionDto dto) {
		/*
		 *  Mapper namespace : opinion
		 *  sql id : getCount
		 *  parameterType : opinionDto
		 *  resultType : int
		 */
		int count=session.selectOne("opinion.getCount", dto);
		
		return count;
	}

	@Override
	public List<OpinionDto> getList(OpinionDto dto) {
		/*
		 *  resultType : opinionDto 
		 */
		List<OpinionDto> list=session.selectList("opinion.getList", dto);
		return list;
	}

	@Override
	public OpinionDto getData(OpinionDto dto) {
		// resultType : opinionDto 
		OpinionDto resultDto=session.selectOne("opinion.getData", dto);
		return resultDto;
	}

	@Override
	public void delete(int num) {
		session.delete("opinion.delete", num);
	}

	@Override
	public void update(OpinionDto dto) {
		session.update("opinion.update", dto);
	}

	@Override
	public void addViewCount(int num) {
		session.update("opinion.addViewCount", num);
	}

	@Override
	public int getCountNoView() {
		return session.selectOne("opinion.getCountNoView");
	}

}