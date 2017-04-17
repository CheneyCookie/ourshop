package com.ourshop.service;

import java.util.List;

import com.ourshop.bean.Address;

public interface AddressService extends BaseService<Address>{
	List<Address> queryJoinUser(int uid);
	
	List<Address> queryTheLast(int uid);
}
