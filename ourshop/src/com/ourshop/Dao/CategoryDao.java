package com.ourshop.Dao;

import java.util.List;

import com.ourshop.bean.Category;

public interface CategoryDao extends BaseDao<Category>{
	//模糊查询类别信息
	List<Category> queryFuzzy(String type,int page,int size);
	
	Long getCount(String type);
	
	void deleteByIds(String ids);
	
	Integer queryIdByType(String type);
}
