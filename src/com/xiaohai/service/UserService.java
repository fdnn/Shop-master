package com.xiaohai.service;

import java.util.List;

import com.xiaohai.entity.User;

public interface UserService {

	public void saveUser(User user);
	
	public void updateUser(User user);
	
	public User findUserById(int id);
	
	public void deleteUser(User user);
	
	public List<User> findAllList();
	
	public List<User> findUserByNameAndPassword(User user);
	// ªÚ’ﬂ–¥≥…£∫public User findUserByNameAndPassword(User user);
}
