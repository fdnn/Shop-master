package com.xiaohai.action;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.xiaohai.entity.Goods;
import com.xiaohai.service.GoodsService;
import com.xiaohai.service.OrderItemService;

public class ShoppingAction extends ActionSupport
{
	@Resource
	private GoodsService goodsService;
	@Resource
	private OrderItemService orderItemService;
	
	
	public String shopping()
	{
		Map request=(Map)ServletActionContext.getContext().get("request");
		//特价商品
		List<Goods> goodsYesTejiaList=goodsService.findAllListByGoodsIsnottejia();
		List<Goods> goodsYesTejiaList1 =new ArrayList<Goods>();
		List<Goods> goodsYesTejiaList2 =new ArrayList<Goods>();
		if(goodsYesTejiaList.size()>10){
			goodsYesTejiaList1=goodsYesTejiaList.subList(0, 5);
			goodsYesTejiaList2=goodsYesTejiaList.subList(5, 10);
			request.put("goodsYesTejiaList1", goodsYesTejiaList1);
			request.put("goodsYesTejiaList2", goodsYesTejiaList2);
		}else if(goodsYesTejiaList.size()>5){
			//返回从0到5-1 的 子列表
			goodsYesTejiaList1=goodsYesTejiaList.subList(0, 5);
			goodsYesTejiaList2=goodsYesTejiaList.subList(5, goodsYesTejiaList.size());
			request.put("goodsYesTejiaList1", goodsYesTejiaList1);
			request.put("goodsYesTejiaList2", goodsYesTejiaList2);
		}else{
			request.put("goodsYesTejiaList1", goodsYesTejiaList);
		}
		
		//推荐商品
		List<Goods> goodsYesTuijianList=goodsService.findAllListByGoodsIsnottuijian();
		List<Goods> goodsYesTuijianList1 =new ArrayList<Goods>();
		List<Goods> goodsYesTuijianList2 =new ArrayList<Goods>();
		if(goodsYesTuijianList.size()>10){
			goodsYesTuijianList1=goodsYesTuijianList.subList(0, 5);
			goodsYesTuijianList2=goodsYesTuijianList.subList(5, 10);
			request.put("goodsYesTuijianList1", goodsYesTuijianList1);
			request.put("goodsYesTuijianList2", goodsYesTuijianList2);
		}else if(goodsYesTuijianList.size()>5){
			//返回从0到5-1 的 子列表
			goodsYesTuijianList1=goodsYesTuijianList.subList(0, 5);
			goodsYesTuijianList2=goodsYesTuijianList.subList(5, goodsYesTuijianList.size());
			request.put("goodsYesTuijianList1", goodsYesTuijianList1);
			request.put("goodsYesTuijianList2", goodsYesTuijianList2);
		}else{
			request.put("goodsYesTuijianList1", goodsYesTuijianList);
		}
		return SUCCESS;
	}
}
