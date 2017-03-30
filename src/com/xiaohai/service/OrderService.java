package com.xiaohai.service;

import java.util.List;

import com.xiaohai.entity.Goods;
import com.xiaohai.entity.Order;
import com.xiaohai.entity.User;

public interface OrderService {
	public void saveOrder(Order order);
	
	public Order findOrderById(int id);
	
	public void deleteOrder(Order order);
	
	public List<Order> findAllList();
	
	public void updateOrder(Order order);
	
	public List<Order> findAllListByUser(User user);
	
	public List<Order> findAllListByDate(Object[] o);
}
