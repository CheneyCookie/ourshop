package com.ourshop.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ourshop.bean.Order;
import com.ourshop.service.OrderService;

@Service("orderService")
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService{

	@Override
	public List<Order> queryByUid(int uid) {
		return orderDao.queryByUid(uid);
	}

	@Override
	public List<Order> queryBypName(String pName,int page,int size) {
		return orderDao.queryBypName(pName,page,size);
	}

	@Override
	public void deleteByIds(String ids) {
		orderDao.deleteByIds(ids);
	}

	@Override
	public Long getCount(String phone) {
		return orderDao.getCount(phone);
	}


}
