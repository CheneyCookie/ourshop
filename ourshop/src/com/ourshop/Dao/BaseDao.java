package com.ourshop.Dao;

import java.util.List;

public interface BaseDao<T> {
	void save(T t);
	void update(T t);
	void delete(T t);
	T get(int id);
	List<T> query();
}
