package com.xiaohai.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaohai.dao.BaseDao;
import com.xiaohai.entity.Order;
import com.xiaohai.entity.OrderItem;
import com.xiaohai.entity.User;
import com.xiaohai.service.OrderItemService;
import com.xiaohai.service.OrderService;

@Service("OrderItemService")
public class OrderItemServiceImpl implements OrderItemService{

	@Resource
	private BaseDao<OrderItem> baseDao;
	
	@Override
	public void saveOrderItemItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		baseDao.save(orderItem);
	}

	@Override
	public OrderItem findOrderItemById(int id) {
		return baseDao.get(OrderItem.class, id);
	}

	@Override
	public void deleteOrderItem(OrderItem orderItem) {
		baseDao.delete(orderItem);
	}

	@Override
	public List<OrderItem> findAllList() {
		return baseDao.find("from OrderItem");
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {
		baseDao.update(orderItem);
	}
	
	@Override
	public List<OrderItem> findAllListByOrder(Order order) {
		return baseDao.find("from OrderItem o where o.order=?", new Object[]{order});
	}
	
}
