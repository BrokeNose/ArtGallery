package com.main.artgallery.user.dao;

import java.util.List;

import com.main.artgallery.user.dto.UserDto;

public interface UserDao {
	public List<UserDto> getList(UserDto dto);
	public void insert(UserDto dto);
	public UserDto getData(String id);
	public void update(UserDto dto);
	public void delete(String id);
	public boolean canUseId(String id);
	public void changePwd(UserDto dto);
}
