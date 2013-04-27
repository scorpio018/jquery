package com.scorpio.service.impl;

import java.util.List;

import com.scorpio.dao.ITfkjDao;
import com.scorpio.service.ITfkjService;
@SuppressWarnings("rawtypes")
public class TfkjServiceImpl implements ITfkjService {
	private ITfkjDao tfkjDao;

	public ITfkjDao getTfkjDao() {
		return tfkjDao;
	}

	public void setTfkjDao(ITfkjDao tfkjDao) {
		this.tfkjDao = tfkjDao;
	}

	@Override
	public List findObjectAll(String sql) {
		return this.tfkjDao.findObjectAll(sql);
	}

	@Override
	public void insertObject(String sql, Object ob) {
		this.tfkjDao.insertObject(sql, ob);
	}
	@Override
	public void updateObject(String sql, Object ob) {
		this.tfkjDao.updateObject(sql, ob);
	}

	@Override
	public List findObject(String sql, Object ob) {
		return tfkjDao.findObject(sql, ob);
	}

	@Override
	public List findObject(String sql, int skipResult, int maxResult) {
		return tfkjDao.findObject(sql, skipResult, maxResult);
	}

	@Override
	public List findObject(String sql, Object ob, int skipResult, int maxResult) {
		return tfkjDao.findObject(sql, ob, skipResult, maxResult);
	}
}
