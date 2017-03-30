package com.xiaohai.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.xiaohai.entity.Goods;
import com.xiaohai.entity.OrderItem;
/*
 * 购物车
 */
public class Cart
{
	protected Map<Integer, OrderItem> items;

	public Cart()
	{
		if (items == null)
		{
			items = new HashMap<Integer, OrderItem>();
		}
	}

	/*
	 * 购物车商品添加
	 */
	public void addGoods(Integer goodsId, OrderItem orderItem)
	{
		if (items.containsKey(goodsId))
		{
			OrderItem orderitem2 = items.get(goodsId);
			orderitem2.setGoodsNumber(orderitem2.getGoodsNumber()+ orderItem.getGoodsNumber());
			items.put(goodsId, orderitem2);
		} else
		{
			items.put(goodsId, orderItem);
		}
	}
	
	/*
	 * 购物车商品删除
	 */
	public void delGoods(Integer goodsId)
	{
		items.remove(goodsId);
	}
	
	/*
	 * 购物车商品数量修改
	 */
	public void updateCart(Integer goodsId, Integer number)
	{
		OrderItem orderItem = items.get(goodsId);
		orderItem.setGoodsNumber(number);
		items.put(goodsId, orderItem);
	}

	/*
	 * 获取总价钱
	 */
	public int getTotalPrice()
	{
		int totalPrice = 0;
		for (Iterator it = items.values().iterator(); it.hasNext();)
		{
			OrderItem orderItem = (OrderItem) it.next();
			Goods goods = orderItem.getGoods();
			int number = orderItem.getGoodsNumber();
			totalPrice += goods.getGoodsTejia() * number;
		}
		return totalPrice;
	}

	/*
	 * 获取订单清单
	 */
	public Map<Integer, OrderItem> getItems()
	{
		return items;
	}
}
