package com.ourshop.Dao;

import java.util.List;

import com.ourshop.bean.ShopCar;

public interface ShopCarDao extends BaseDao<ShopCar>{
	List<ShopCar> queryByUid(int uid);
	
	void deleteByIds(String ids);
	
	List<ShopCar> queryAddToOrder(String ids,int uid);
}
