package com.ourshop.service;


import java.util.List;

import com.ourshop.bean.Order;

public interface OrderService extends BaseService<Order>{
	List<Order> queryByUid(int uid);
	
	List<Order> queryBypName(String pName,int page,int size);
	
	void deleteByIds(String ids);
	
	Long getCount(String pName);
}
