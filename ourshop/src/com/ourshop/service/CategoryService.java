package com.ourshop.service;

import java.util.List;

import com.ourshop.bean.Category;

public interface CategoryService extends BaseService<Category>{
	//模糊查询类别信息
	List<Category> queryFuzzy(String type,int page,int size);
		
	Long getCount(String type);
	//根据id删除多条记录
	void deleteByIds(String ids);
	
	Integer queryIdByType(String type);
}
