package com.xiaohai.action;

import java.util.Iterator;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.xiaohai.entity.Goods;
import com.xiaohai.entity.OrderItem;
import com.xiaohai.service.GoodsService;
import com.xiaohai.util.Cart;

public class CartAction extends ActionSupport
{
	private int goodsId;
	private int number;
		
	private String message;
	private String path;
	
	@Resource
	private GoodsService goodsService;
	
	/*
	 * 添加商品进购物车
	 */
	public String addToCart()
	{
		Goods goods=goodsService.findGoodsById(goodsId);
		OrderItem orderItem=new OrderItem();
		orderItem.setGoods(goods);
		orderItem.setGoodsNumber(number);
		
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		if(cart==null){
			Cart cart2 = new Cart();
			session.put("cart",cart2);
			cart2.addGoods(goodsId, orderItem);
			//加入购物车
			session.put("cart",cart2);
		}else{
			cart.addGoods(goodsId, orderItem);
			//加入购物车
			session.put("cart",cart);
		}
		//this.setMessage("");
		this.setPath("myCart.action");
		return "succeed";
	}
	
	public String changeNumFromCart(){
		if(goodsService.findGoodsById(goodsId).getGoodsKucun()<number)
			this.setMessage("库存不足");
		else{
			Map session= ServletActionContext.getContext().getSession();
			Cart cart = (Cart)session.get("cart");
			cart.updateCart(goodsId, number);
			session.put("cart", cart);
		}
		this.setPath("myCart.action");
		return "succeed";
	}
	
	public String clearCart(){
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		cart.getItems().clear();
		this.setPath("myCart.action");
		return "succeed";
	}
	
	public String delGoodsFromCart(){
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		cart.delGoods(goodsId);
		this.setPath("myCart.action");
		return "succeed";
	}
	
	public String testCart()
	{
		Map session= ServletActionContext.getContext().getSession();
		Cart cart = (Cart)session.get("cart");
		Map items=cart.getItems();
		
		for (Iterator it = items.values().iterator(); it.hasNext();)
		{
			OrderItem orderItem = (OrderItem) it.next();
			Goods goods = orderItem.getGoods();
			System.out.println(goods.getGoodsName()+"商品名称");
			int number = orderItem.getGoodsNumber();
			System.out.println(number+"商品数量");
			System.out.println("--------------------------------------------------");
		}
		return null;
	}
	public String myCart()
	{
		return SUCCESS;
	}
		
	public String orderQueren()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		return SUCCESS;
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
