package com.ourshop.service;

import java.util.List;

import com.ourshop.bean.ShopCar;

public interface ShopCarService extends BaseService<ShopCar> {
	List<ShopCar> queryByUid(int uid);
	void deleteByIds(String ids);
	List<ShopCar> queryAddToOrder(String ids,int uid);
}
