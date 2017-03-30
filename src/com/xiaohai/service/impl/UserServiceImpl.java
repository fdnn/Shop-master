package com.xiaohai.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaohai.dao.BaseDao;
import com.xiaohai.entity.User;
import com.xiaohai.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	private BaseDao<User> baseDao;
	
	@Override
	public void saveUser(User user) {
		// TODO Auto-generated method stub
		baseDao.save(user);
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		baseDao.update(user);
	}

	@Override
	public User findUserById(int id) {
		return baseDao.get(User.class, id);
	}

	@Override
	public void deleteUser(User user) {
		baseDao.delete(user);
	}

	@Override
	public List<User> findAllList() {
		return baseDao.find("from User");
	}

	@Override
	public List<User> findUserByNameAndPassword(User user) {
		return baseDao.find("from User u where u.userName=? and u.userPw=?", new Object[]{user.getUserName(),user.getUserPw()});
	}
	/* ªÚ’ﬂ–¥≥…£∫
	@Override
	public User findUserByNameAndPassword(User user) {
		return baseDao.get("from User u where u.userName=? and u.userPw=?", new Object[]{user.getUserName(),user.getUserPw()});
	}*/
}
