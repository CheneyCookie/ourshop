package com.ourshop.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ourshop.bean.Address;
import com.ourshop.service.AddressService;


@Service("addressService")
public class AddressServiceImpl extends BaseServiceImpl<Address> implements AddressService{

	@Override
	public List<Address> queryJoinUser(int uid) {
		return addressDao.queryJoinUser(uid);
	}

	@Override
	public List<Address> queryTheLast(int uid) {
		return addressDao.queryTheLast(uid);
	}

}
