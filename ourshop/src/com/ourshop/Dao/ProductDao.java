package com.ourshop.Dao;

import java.util.List;

import com.ourshop.bean.Product;

public interface ProductDao extends BaseDao<Product>{
	
	List<Product> queryJoinCategory(String name,int page,int size);
	
	
	Long getCount(String name);
	
	void deleteByIds(String ids);
	
	//仅查询前四个
	List<Product> queryByCid(int cid);
	//查询所有
	List<Product> queryAllByCid(int cid);
	//查询搜索框内容
	List<Product> queryBySearch(String search);
	//下拉查询
	List<Product> queryByScrollLine(int line,int cid);
	
	Product getJoinFetchCategory(int id);
	
}
