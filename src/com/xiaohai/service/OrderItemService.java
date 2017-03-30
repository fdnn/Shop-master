package com.xiaohai.service;

import java.util.List;

import com.xiaohai.entity.Goods;
import com.xiaohai.entity.Order;
import com.xiaohai.entity.OrderItem;

public interface OrderItemService {
	public void saveOrderItemItem(OrderItem orderItem);
	
	public OrderItem findOrderItemById(int id);
	
	public void deleteOrderItem(OrderItem orderItem);
	
	public List<OrderItem> findAllList();
	
	public void updateOrderItem(OrderItem orderItem);

	public List<OrderItem> findAllListByOrder(Order order);
}
