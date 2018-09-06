package com.main.artgallery.opinion.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.artgallery.opinion.dto.OpinionCommentDto;


@Repository
public class OpinionCommentDaoImpl implements OpinionCommentDao{
	@Autowired
	private SqlSession session;

	@Override
	public int getSequence() {
		//새로 저장할 댓글의 글번호를 미리 얻어와서 
		int seq=session.selectOne("opinionComment.getSequence");
		//리턴해 주기 
		return seq;
	}

	@Override
	public void insert(OpinionCommentDto dto) {
		session.insert("opinionComment.insert", dto);
	}

	@Override
	public List<OpinionCommentDto> getList(int ref_group) {
		
		return session.selectList("opinionComment.getList", ref_group);
	}
	
}







