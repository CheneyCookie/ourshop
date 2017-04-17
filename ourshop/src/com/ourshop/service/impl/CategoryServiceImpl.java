package com.ourshop.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ourshop.bean.Category;
import com.ourshop.service.CategoryService;

@Service("categoryService")
public class CategoryServiceImpl extends BaseServiceImpl<Category> implements CategoryService{

	@Override
	public List<Category> queryFuzzy(String type, int page, int size) {
		return categoryDao.queryFuzzy(type, page, size);
	}

	@Override
	public Long getCount(String type) {
		return categoryDao.getCount(type);
	}

	@Override
	public void deleteByIds(String ids) {
		categoryDao.deleteByIds(ids);
	}

	@Override
	public Integer queryIdByType(String type) {
		return categoryDao.queryIdByType(type);
	}
	
}
