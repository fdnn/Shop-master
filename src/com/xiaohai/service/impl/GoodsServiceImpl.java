package com.xiaohai.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaohai.dao.BaseDao;
import com.xiaohai.entity.Gonggao;
import com.xiaohai.entity.Goods;
import com.xiaohai.service.GoodsService;

@Service("GoodsService")
public class GoodsServiceImpl implements GoodsService{

	@Resource
	private BaseDao<Goods> baseDao;
	
	@Override
	public void saveGoods(Goods goods) {
		// TODO Auto-generated method stub
		baseDao.save(goods);
	}

	@Override
	public Goods findGoodsById(int id) {
		return baseDao.get(Goods.class, id);
	}

	@Override
	public void deleteGoods(Goods goods) {
		baseDao.delete(goods);
	}

	@Override
	public List<Goods> findAllList() {
		return baseDao.executeProc("{call sp_goods()}",new Goods());
	}

	@Override
	public void updateGoods(Goods goods) {
		baseDao.update(goods);
	}

	@Override
	public List<Goods> findAllListByGoodsIsnottejia() {
		//return baseDao.find("from Goods where goodsIsnottejia='yes' order by goodsId");
		return baseDao.executeProc("{call sp_goodsIsnottejia()}",new Goods());
	}

	@Override
	public List<Goods> findAllListByGoodsIsnottuijian() {
		//return baseDao.find("from Goods where goodsIsnottuijian='yes' order by goodsId");
		return baseDao.executeProc("{call sp_goodsIsnottuijian()}",new Goods());
	}

	@Override
	public List<Goods> findAllListBySearch(String goodsName) {
		return baseDao.find("from Goods where goodsName like '%"+goodsName+"%' order by goodsId");
	}
	
}
