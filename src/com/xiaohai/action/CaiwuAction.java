package com.xiaohai.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.xiaohai.entity.Goods;
import com.xiaohai.entity.Order;
import com.xiaohai.entity.OrderItem;
import com.xiaohai.entity.User;
import com.xiaohai.service.GoodsService;
import com.xiaohai.service.OrderItemService;
import com.xiaohai.service.OrderService;
import com.xiaohai.util.Cart;

public class CaiwuAction extends ActionSupport
{
	@Resource
	private OrderService orderService;
	
	public String caiwuMana()
	{
		List orderList=orderService.findAllList();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderList", orderList);
		return SUCCESS;
	}
	
	public String caiwuTongji()
	{
		HttpServletRequest request1=ServletActionContext.getRequest();
		String shijian_sta=request1.getParameter("shijian_sta");
		String shijian_end=request1.getParameter("shijian_end");
		Object[] o={shijian_sta,shijian_end};
		List orderList=orderService.findAllListByDate(o);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderList", orderList);
		return SUCCESS;
	}
}
