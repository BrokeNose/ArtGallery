package com.main.artgallery.user.dao;

import java.util.List;

import com.main.artgallery.user.dto.UserDto;

public interface UserDao {
	public List<UserDto> getList(UserDto dto);
	public boolean canUseId(String id);
	public boolean insert(UserDto dto);
	public UserDto getData(String id);
	public void update(UserDto dto);
	public void leave(String id);
	public void delete(String id);
	public void changePwd(UserDto dto);
}
