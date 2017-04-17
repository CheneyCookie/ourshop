package com.ourshop.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ourshop.bean.ShopCar;
import com.ourshop.service.ShopCarService;

@Service("shopCarService")
public class ShopCarServiceImpl extends BaseServiceImpl<ShopCar> implements ShopCarService{

	@Override
	public List<ShopCar> queryByUid(int uid) {
		
		return shopCarDao.queryByUid(uid);
	}

	@Override
	public void deleteByIds(String ids) {
		shopCarDao.deleteByIds(ids);
	}

	@Override
	public List<ShopCar> queryAddToOrder(String ids,int uid) {
		return shopCarDao.queryAddToOrder(ids,uid);
	}

	
}
