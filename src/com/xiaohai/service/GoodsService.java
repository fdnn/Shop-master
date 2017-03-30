package com.xiaohai.service;

import java.util.List;

import com.xiaohai.entity.Goods;

public interface GoodsService {
	public void saveGoods(Goods goods);
	
	public Goods findGoodsById(int id);
	
	public void deleteGoods(Goods goods);
	
	public List<Goods> findAllList();
	
	public void updateGoods(Goods goods);
	
	public List<Goods> findAllListByGoodsIsnottejia();
	
	public List<Goods> findAllListByGoodsIsnottuijian();

	public List<Goods> findAllListBySearch(String goodsName);
}
