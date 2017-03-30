package com.xiaohai.service;

import java.util.List;

import com.xiaohai.entity.Catelog;
import com.xiaohai.entity.Goods;

public interface CatelogService {
	public void saveCatelog(Catelog catelog);
	
	public Catelog findCatelogById(int id);
	
	public void deleteCatelog(Catelog catelog);
	
	public List<Catelog> findAllList();

	public List<Goods> findGoods(int id);
	
	public Catelog findCatelogByName(String str);
}
