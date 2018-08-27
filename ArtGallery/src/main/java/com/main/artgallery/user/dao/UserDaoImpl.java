package com.main.artgallery.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.main.artgallery.user.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SqlSession session;
	@Override
	public List<UserDto> getList(UserDto dto) {
		return session.selectList("user.getList", dto);
	}
	@Override
	public boolean canUseId(String id) {
		String result=session.selectOne("user.isExist", id);
		if(result==null) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public boolean insert(UserDto dto) {
		int flag=0;
		flag=session.insert("user.insert", dto);
		if(flag>0) {
			return true;
		} else {
			return false;
		}
	}
	@Override
	public UserDto getData(String id) {
		return session.selectOne("user.getData", id);
	}
	@Override
	public void update(UserDto dto) {
		session.update("user.update", dto);
	}
	@Override
	public void leave(String id) {
		session.update("user.leave", id);
	}
	@Override
	public void delete(String id) {
		session.delete("user.delete", id);
	}
	@Override
	public void changePwd(UserDto dto) {
		session.update("user.changePwd", dto);
	}
}
