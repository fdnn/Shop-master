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

public class OrderAction extends ActionSupport
{
	private int goodsId;
	private int number;
	
	private int orderId;
	private String orderSonghuodizhi;
	private String orderFukuangfangshi;
		
	private String message;
	private String path;
	
	@Resource
	private OrderService orderService;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private GoodsService goodsService;
	
	/*
	 * 订单确认
	 */
	public String orderQueren()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		return SUCCESS;
	}
	/*
	 * 订单提交
	 */
	public String orderSubmit()
	{
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		User user=(User)session.get("user");
		Order order=new Order();
		order.setOrderAmount(cart.getTotalPrice());
		order.setOrderBianhao(new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()));
		order.setOrderDate(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
		order.setOrderFukuangfangshi(orderFukuangfangshi);
		order.setOrderSonghuodizhi(orderSonghuodizhi);
		order.setOrderZhuangtai("no");
		order.setOrderUser(user);
		
		orderService.saveOrder(order);
		
		for (Iterator it = cart.getItems().values().iterator(); it.hasNext();)
		{
			OrderItem orderItem = (OrderItem) it.next();
			orderItem.setOrder(order);
			orderItem.setGoods(orderItem.getGoods());
			Goods goods = goodsService.findGoodsById(orderItem.getGoods().getGoodsId());
			//减少库存
			goods.setGoodsKucun(goods.getGoodsKucun() - orderItem.getGoodsNumber());
			goodsService.saveGoods(goods);
			orderItemService.saveOrderItemItem(orderItem);
		}
		
		cart.getItems().clear();
		session.put("cart", cart);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("order", order);
		
		return SUCCESS;
	}
	
	/*
	 * 获取用户全部订单
	 */
	public String myOrder()
	{
		Map session= ServletActionContext.getContext().getSession();
		User user=(User)session.get("user");
		
		List<Order> orderList=orderService.findAllListByUser(user);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderList", orderList);
		
		return SUCCESS;
	}
	
	/*
	 * 获取全部用户订单
	 */
	public String orderMana()
	{
		List orderList=orderService.findAllList();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderList", orderList);
		return SUCCESS;
	}
	
	/*
	 * 用户删除订单
	 */
	public String orderDel()
	{
		Order order=orderService.findOrderById(orderId);
		orderService.deleteOrder(order);
		Map session= ServletActionContext.getContext().getSession();
		User user=(User)session.get("user");
		this.setMessage("删除成功");
		this.setPath("myOrder.action?userId="+user.getUserId());
		return "succeed";
	}
	
	/*
	 * 管理员删除订单
	 */
	public String orderDelByAdmin()
	{
		Order order=orderService.findOrderById(orderId);
		orderService.deleteOrder(order);
		
		OrderItem orderItem = new OrderItem();
		orderItem.setOrder(order);
		orderItemService.deleteOrderItem(orderItem);
		
		this.setMessage("删除成功");
		this.setPath("orderMana.action");
		return "succeed";
	}
	
	/*
	 * 订单受理
	 */
	public String orderShouli()
	{
		Order order=orderService.findOrderById(orderId);
		order.setOrderZhuangtai("yes");
		orderService.updateOrder(order);
		this.setMessage("受理订单成功");
		this.setPath("orderMana.action");
		return "succeed";
	}
	
	/*
	 * 根据订单id获取全部订单明细
	 */
	public String orderDetail()
	{
		Order order = new Order();
		order.setOrderId(orderId);
		List<OrderItem> orderItemList=orderItemService.findAllListByOrder(order);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("orderItemList", orderItemList);
		return ActionSupport.SUCCESS;
	}
	
	public int getGoodsId() {
		return goodsId;
	}



	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}



	public int getNumber() {
		return number;
	}



	public void setNumber(int number) {
		this.number = number;
	}



	public int getOrderId() {
		return orderId;
	}



	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}



	public String getOrderSonghuodizhi() {
		return orderSonghuodizhi;
	}



	public void setOrderSonghuodizhi(String orderSonghuodizhi) {
		this.orderSonghuodizhi = orderSonghuodizhi;
	}



	public String getOrderFukuangfangshi() {
		return orderFukuangfangshi;
	}



	public void setOrderFukuangfangshi(String orderFukuangfangshi) {
		this.orderFukuangfangshi = orderFukuangfangshi;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public String getPath() {
		return path;
	}



	public void setPath(String path) {
		this.path = path;
	}
	
}
