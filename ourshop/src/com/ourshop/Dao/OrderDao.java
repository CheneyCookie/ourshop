package com.ourshop.Dao;


import java.util.List;

import com.ourshop.bean.Order;

public interface OrderDao extends BaseDao<Order>{
	List<Order> queryByUid(int uid);
	
	List<Order> queryBypName(String pName,int page,int size);
	
	void deleteByIds(String ids);
	
	Long getCount(String phone);
	
}
