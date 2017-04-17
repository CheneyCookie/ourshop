package com.ourshop.Dao;

import java.util.List;

import com.ourshop.bean.Address;

public interface AddressDao extends BaseDao<Address>{
	List<Address> queryJoinUser(int uid);
	
	List<Address> queryTheLast(int uid);
}
