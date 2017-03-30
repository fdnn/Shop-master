package com.xiaohai.util;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.xiaohai.entity.Goods;
import com.xiaohai.entity.OrderItem;
/*
 * ���ﳵ
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
	 * ���ﳵ��Ʒ���
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
	 * ���ﳵ��Ʒɾ��
	 */
	public void delGoods(Integer goodsId)
	{
		items.remove(goodsId);
	}
	
	/*
	 * ���ﳵ��Ʒ�����޸�
	 */
	public void updateCart(Integer goodsId, Integer number)
	{
		OrderItem orderItem = items.get(goodsId);
		orderItem.setGoodsNumber(number);
		items.put(goodsId, orderItem);
	}

	/*
	 * ��ȡ�ܼ�Ǯ
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
	 * ��ȡ�����嵥
	 */
	public Map<Integer, OrderItem> getItems()
	{
		return items;
	}
}
