package com.xiaohai.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaohai.dao.BaseDao;
import com.xiaohai.entity.Order;
import com.xiaohai.entity.User;
import com.xiaohai.service.OrderService;

@Service("OrderService")
public class OrderServiceImpl implements OrderService{

	@Resource
	private BaseDao<Order> baseDao;
	
	@Override
	public void saveOrder(Order order) {
		// TODO Auto-generated method stub
		baseDao.save(order);
	}

	@Override
	public Order findOrderById(int id) {
		return baseDao.get(Order.class, id);
	}

	@Override
	public void deleteOrder(Order order) {
		baseDao.delete(order);
	}

	@Override
	public List<Order> findAllList() {
		return baseDao.find("from Order");
	}

	@Override
	public void updateOrder(Order order) {
		baseDao.update(order);
	}

	@Override
	public List<Order> findAllListByUser(User user) {
		return baseDao.find("from Order o where o.orderUser=?", new Object[]{user});
	}

	@Override
	public List<Order> findAllListByDate(Object[] o) {
		return baseDao.find("from Order where orderDate >=? and orderDate<=?",o);
	}
	
}
