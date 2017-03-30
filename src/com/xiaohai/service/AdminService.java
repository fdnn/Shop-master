package com.xiaohai.service;

import java.util.List;

import com.xiaohai.entity.Admin;

public interface AdminService {

	public void saveUser(Admin admin);
	
	public void updateUser(Admin admin);
	
	public Admin findUserById(int id);
	
	public void deleteUser(Admin admin);
	
	public List<Admin> findAllList();
	
	public Admin findUserByNameAndPassword(Admin admin);
}
