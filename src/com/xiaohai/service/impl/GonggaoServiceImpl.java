package com.xiaohai.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xiaohai.dao.BaseDao;
import com.xiaohai.entity.Gonggao;
import com.xiaohai.service.GonggaoService;

@Service("gonggaoService")
public class GonggaoServiceImpl implements GonggaoService{

	@Resource
	private BaseDao<Gonggao> baseDao;
	
	@Override
	public void saveGonggao(Gonggao gonggao) {
		// TODO Auto-generated method stub
		baseDao.save(gonggao);
	}

	@Override
	public Gonggao findGonggaoById(int id) {
		return baseDao.get(Gonggao.class, id);
	}

	@Override
	public void deleteGonggao(Gonggao gonggao) {
		baseDao.delete(gonggao);
	}

	@Override
	public List<Gonggao> findAllList() {
		return baseDao.executeProc("{call sp_gonggao()}",new Gonggao());
	}
}
