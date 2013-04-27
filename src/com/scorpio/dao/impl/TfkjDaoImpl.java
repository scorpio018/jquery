package com.scorpio.dao.impl;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.scorpio.dao.ITfkjDao;
@SuppressWarnings("rawtypes")
public class TfkjDaoImpl extends SqlMapClientDaoSupport implements ITfkjDao {
	@Override
	public List findObjectAll(String sql) {
		return this.getSqlMapClientTemplate().queryForList("getGoodsList");
	}
	@Override
	public void insertObject(String sql, Object ob) {
		this.getSqlMapClientTemplate().insert(sql, ob);
	}
	@Override
	public void updateObject(String sql, Object ob) {
		this.getSqlMapClientTemplate().update(sql, ob);
	}
	@Override
	public List findObject(String sql, Object ob) {
		return this.getSqlMapClientTemplate().queryForList(sql, ob);
	}
	@Override
	public List findObject(String sql, int skipResult, int maxResult) {
		return this.getSqlMapClientTemplate().queryForList(sql, skipResult, maxResult);
	}
	@Override
	public List findObject(String sql, Object ob, int skipResult, int maxResult) {
		return this.getSqlMapClientTemplate().queryForList(sql, ob, skipResult, maxResult);
	}
}
