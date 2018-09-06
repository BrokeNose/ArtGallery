package com.main.artgallery.art.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.artgallery.art.dto.ArtCommentDto;

/*
 * 작성자 : hyung
 * 비고 : 
 */

@Repository
public class ArtCommentDaoImpl implements ArtCommentDao {
	@Autowired
	private SqlSession session;
	
	@Override
	public int getSequence() {
		return session.selectOne("artComment.getSequence");
	}

	@Override
	public void insert(ArtCommentDto dto) {
		session.insert("artComment.insert", dto);
	}

	@Override
	public void delete(int num) {
		session.delete("artComment.insert", num);
	}

	@Override
	public List<ArtCommentDto> getList(ArtCommentDto dto) {
		return session.selectList("artComment.getList", dto);
	}

	@Override
	public int getCount(ArtCommentDto dto) {
		return session.selectOne("artComment.getCount", dto);
	}

}
