package com.scorpio.service;

import java.util.List;

public interface ITfkjService {
	List findObjectAll(String sql);
	List findObject(String sql, Object ob);
	List findObject(String sql, int skipResult, int maxResult);
	List findObject(String sql, Object ob, int skipResult, int maxResult);
	void insertObject(String sql, Object ob);
	void updateObject(String sql, Object ob);
}
