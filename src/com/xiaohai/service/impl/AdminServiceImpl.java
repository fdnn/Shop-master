package com.xiaohai.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaohai.dao.BaseDao;
import com.xiaohai.entity.Admin;
import com.xiaohai.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Resource
	private BaseDao<Admin> baseDao;
	
	@Override
	public void saveUser(Admin admin) {
		// TODO Auto-generated method stub
		baseDao.save(admin);
	}

	@Override
	public void updateUser(Admin admin) {
		// TODO Auto-generated method stub
		baseDao.update(admin);
	}

	@Override
	public Admin findUserById(int id) {
		return baseDao.get(Admin.class, id);
	}

	@Override
	public void deleteUser(Admin admin) {
		baseDao.delete(admin);
	}

	@Override
	public List<Admin> findAllList() {
		return baseDao.find("from Admin");
	}

	@Override
	public Admin findUserByNameAndPassword(Admin admin) {
		return baseDao.get("from Admin a where a.userName=? and a.userPw=?", new Object[]{admin.getUserName(),admin.getUserPw()});
	}

}
