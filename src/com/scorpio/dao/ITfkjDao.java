package com.scorpio.dao;

import java.util.List;

public interface ITfkjDao {
	List findObjectAll(String sql);
	List findObject(String sql, Object ob);
	List findObject(String sql, int skipResult, int maxResult);
	List findObject(String sql, Object ob, int skipResult, int maxResult);
	void insertObject(String sql, Object ob);
	void updateObject(String sql, Object ob);
}
