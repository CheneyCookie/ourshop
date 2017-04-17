package com.ourshop.service;

import java.util.List;

public interface BaseService<T> {
	void save(T t);
	void update(T t);
	void delete(T t);
	T get(int id);
	List<T> query();
}
