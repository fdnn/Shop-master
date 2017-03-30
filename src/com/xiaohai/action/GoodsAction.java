package com.xiaohai.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.xiaohai.entity.Goods;
import com.xiaohai.service.CatelogService;
import com.xiaohai.service.GoodsService;

@Controller
public class GoodsAction extends ActionSupport
{

	private static final long serialVersionUID = 1L;
	
	private int goodsId;
	private String goodsCatelogId;
	private String goodsName;
	private String goodsMiaoshu;
	private String goodsPic;
	private String goodsTuijian;
	private String goodsShichangjia;
	private String goodsTejia;
	private String goodsKucun;
	
	private String message;
	private String path;
	
	@Resource
	private GoodsService goodsService;
	@Resource
	private CatelogService catelogService;

	private int page;

	private int totalPage ;
	
	/*
	 * 商品添加
	 */
	public String goodsAdd()
	{
		Goods goods=new Goods();
		goods.setGoodsCatelogId(catelogService.findCatelogByName(goodsCatelogId));
		goods.setGoodsName(goodsName);
		goods.setGoodsMiaoshu(goodsMiaoshu);
		goods.setGoodsPic(goodsPic);
		if(goodsTuijian.equals("是"))
		{
			goods.setGoodsIsnottuijian("yes");
		}else{
			goods.setGoodsIsnottuijian("no");
		}
		goods.setGoodsShichangjia(Integer.parseInt(goodsShichangjia));
		if(Integer.parseInt(goodsTejia)==0)//特格为0表示没有特价
		{
			goods.setGoodsTejia(Integer.parseInt(goodsShichangjia));// 如果不是特价商品。把这个商品的特价设置为市场价格
			goods.setGoodsIsnottejia("no");
		}
		else
		{
			goods.setGoodsTejia(Integer.parseInt(goodsTejia));
			goods.setGoodsIsnottejia("yes");
		}
		goods.setGoodsKucun(Integer.parseInt(goodsKucun));
		goodsService.saveGoods(goods);
		this.setMessage("商品添加成功");
		this.setPath("goodsMana.action");
		return "succeed";
	}
	
	/*
	 * 商品管理
	 */
	public String goodsMana()
	{
		List goodsList =goodsService.findAllList();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		return SUCCESS;
	}
	
	/*
	 * 商品删除
	 */
	public String goodsDel()
	{
		Goods goods=goodsService.findGoodsById(goodsId);
		goodsService.deleteGoods(goods);
		this.setMessage("商品成功删除");
		this.setPath("goodsMana.action");
		return "succeed";
	}
	
	/*
	 * 商品内容
	 */
	public String goodsDetail()
	{
		Goods goods=goodsService.findGoodsById(goodsId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goods", goods);
		return SUCCESS;
	}
	
	/*
	 * 商品数据
	 */
	public String goodsDate()
	{
		Goods goods=goodsService.findGoodsById(goodsId);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goods", goods);
		
		List catelogList =catelogService.findAllList();
		request.put("catelogList", catelogList);
		return SUCCESS;
	}
	
	/*
	 * 商品更新
	 */
	public String goodsUpdate()
	{
		Goods goods=new Goods();
		goods.setGoodsId(goodsId);
		System.out.println(goodsCatelogId);
		System.out.println(catelogService.findCatelogByName(goodsCatelogId));
		goods.setGoodsCatelogId(catelogService.findCatelogByName(goodsCatelogId));
		goods.setGoodsName(goodsName);
		goods.setGoodsMiaoshu(goodsMiaoshu);
		goods.setGoodsPic(goodsPic);
		if(goodsTuijian.equals("是"))
		{
			goods.setGoodsIsnottuijian("yes");
		}else{
			goods.setGoodsIsnottuijian("no");
		}
		goods.setGoodsIsnottejia(goodsTuijian);
		goods.setGoodsShichangjia(Integer.parseInt(goodsShichangjia));
		if(Integer.parseInt(goodsTejia)==0)//特格为0表示没有特价
		{
			goods.setGoodsTejia(Integer.parseInt(goodsShichangjia));// 如果不是特价商品。把这个商品的特价设置为市场价格
			goods.setGoodsIsnottejia("no");
		}
		else
		{
			goods.setGoodsTejia(Integer.parseInt(goodsTejia));
			goods.setGoodsIsnottejia("yes");
		}
		goods.setGoodsKucun(Integer.parseInt(goodsKucun));
		goodsService.updateGoods(goods);
		this.setMessage("商品修改成功");
		this.setPath("goodsMana.action");
		return "succeed";
	}

	public String goodsKucun()
	{
		List goodsList =goodsService.findAllList();
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("goodsList", goodsList);
		return SUCCESS;
	}
	
	public String goodsAllYesTejia()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		List<Goods> goodsYesTejiaList=goodsService.findAllListByGoodsIsnottejia();
		
		if(goodsYesTejiaList.size()%10 == 0){
			totalPage = goodsYesTejiaList.size()/10;
		}else{
			totalPage = goodsYesTejiaList.size()/10+1;
		}
		
		if(totalPage == page && goodsYesTejiaList.size()>10){
			goodsYesTejiaList = goodsYesTejiaList.subList((page-1)*10, (page-1)*10+goodsYesTejiaList.size()%10);
		}else if(!(totalPage == page) && goodsYesTejiaList.size()>10){
			goodsYesTejiaList = goodsYesTejiaList.subList((page-1)*10, page*10);
		}
		request.put("goodsYesTejiaList", goodsYesTejiaList);
		
		List<String> totalPageList = new ArrayList<String>();
		for(int i = 1;i<=totalPage;i++){
			totalPageList.add(i+"");
		}
		request.put("totalPage", totalPage);
		request.put("totalPageList", totalPageList);
		return SUCCESS;
	}
	
	public String goodsAllYesTuijian()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		List<Goods> goodsYesTuijianList=goodsService.findAllListByGoodsIsnottuijian();
		
		if(goodsYesTuijianList.size()%10 == 0){
			totalPage = goodsYesTuijianList.size()/10;
		}else{
			totalPage = goodsYesTuijianList.size()/10+1;
		}
		
		if(totalPage == page && goodsYesTuijianList.size()>10){
			goodsYesTuijianList = goodsYesTuijianList.subList((page-1)*10, (page-1)*10+goodsYesTuijianList.size()%10);
		}else if(!(totalPage == page) && goodsYesTuijianList.size()>10){
			goodsYesTuijianList = goodsYesTuijianList.subList((page-1)*10, page*10);
		}
		request.put("goodsYesTuijianList", goodsYesTuijianList);
		
		List<String> totalPageList = new ArrayList<String>();
		for(int i = 1;i<=totalPage;i++){
			totalPageList.add(i+"");
		}
		request.put("totalPage", totalPage);
		request.put("totalPageList", totalPageList);
		return SUCCESS;
	}
	
	public String goodsAllSearch()
	{
        Map request=(Map)ServletActionContext.getContext().get("request");
		List<Goods> goodsList=goodsService.findAllListBySearch(goodsName);
		
		if(goodsList.size()%10 == 0){
			totalPage = goodsList.size()/10;
		}else{
			totalPage = goodsList.size()/10+1;
		}
		
		if(totalPage == page && goodsList.size()>10){
			goodsList = goodsList.subList((page-1)*10, (page-1)*10+goodsList.size()%10);
		}else if(!(totalPage == page) && goodsList.size()>10){
			goodsList = goodsList.subList((page-1)*10, page*10);
		}
		request.put("goodsName", goodsName);
		request.put("goodsList", goodsList);
		
		List<String> totalPageList = new ArrayList<String>();
		for(int i = 1;i<=totalPage;i++){
			totalPageList.add(i+"");
		}
		request.put("totalPage", totalPage);
		request.put("totalPageList", totalPageList);
		return SUCCESS;
	}
	
	public int getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsCatelogId() {
		return goodsCatelogId;
	}

	public void setGoodsCatelogId(String goodsCatelogId) {
		this.goodsCatelogId = goodsCatelogId;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsMiaoshu() {
		return goodsMiaoshu;
	}

	public void setGoodsMiaoshu(String goodsMiaoshu) {
		this.goodsMiaoshu = goodsMiaoshu;
	}

	public String getGoodsPic() {
		return goodsPic;
	}

	public void setGoodsPic(String goodsPic) {
		this.goodsPic = goodsPic;
	}

	public String getGoodsTuijian() {
		return goodsTuijian;
	}

	public void setGoodsTuijian(String goodsTuijian) {
		this.goodsTuijian = goodsTuijian;
	}

	public String getGoodsShichangjia() {
		return goodsShichangjia;
	}

	public void setGoodsShichangjia(String goodsShichangjia) {
		this.goodsShichangjia = goodsShichangjia;
	}

	public String getGoodsTejia() {
		return goodsTejia;
	}

	public void setGoodsTejia(String goodsTejia) {
		this.goodsTejia = goodsTejia;
	}

	public String getGoodsKucun() {
		return goodsKucun;
	}

	public void setGoodsKucun(String goodsKucun) {
		this.goodsKucun = goodsKucun;
	}

	public GoodsService getGoodsService() {
		return goodsService;
	}

	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
}
