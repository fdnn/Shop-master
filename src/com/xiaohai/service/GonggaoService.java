package com.xiaohai.service;

import java.util.List;

import com.xiaohai.entity.Gonggao;

public interface GonggaoService {
	public void saveGonggao(Gonggao gonggao);
	
	public Gonggao findGonggaoById(int id);
	
	public void deleteGonggao(Gonggao gonggao);
	
	public List<Gonggao> findAllList();
}
