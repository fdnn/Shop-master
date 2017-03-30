package com.xiaohai.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaohai.dao.BaseDao;
import com.xiaohai.entity.Catelog;
import com.xiaohai.entity.Gonggao;
import com.xiaohai.entity.Goods;
import com.xiaohai.service.CatelogService;

@Service("catelogService")
public class CatelogServiceImpl implements CatelogService{

	@Resource
	private BaseDao<Catelog> baseDao;
	@Resource
	private BaseDao<Goods> GoodsBaseDao;
	
	@Override
	public void saveCatelog(Catelog catelog) {
		// TODO Auto-generated method stub
		baseDao.save(catelog);
	}

	@Override
	public Catelog findCatelogById(int id) {
		return baseDao.get(Catelog.class, id);
	}

	@Override
	public void deleteCatelog(Catelog catelog) {
		baseDao.delete(catelog);
	}

	@Override
	public List<Catelog> findAllList() {
		return baseDao.executeProc("{call sp_catelog()}",new Catelog());
	}
	
	@Override
	public List<Goods> findGoods(int id) {
		return GoodsBaseDao.find("from Goods where goodsCatelogId="+id);
	}
	
	@Override
	public Catelog findCatelogByName(String str){
		return baseDao.get("from Catelog where catelogName=?", new String[]{str});
	}
}
