package com.ourshop.service;

import java.util.List;

import com.ourshop.bean.Product;

public interface ProductService extends BaseService<Product>{
	
	List<Product> queryJoinCategory(String name,int page,int size);
	
	
	Long getCount(String name);
	
	void deleteByIds(String ids);
	
	List<Product> queryByCid(int cid);
	
	List<Product> queryAllByCid(int cid);
	
	//查询搜索框内容
	List<Product> queryBySearch(String search);
	//下拉查询
	List<Product> queryByScrollLine(int line,int cid);
	
	Product getJoinFetchCategory(int id);
}
