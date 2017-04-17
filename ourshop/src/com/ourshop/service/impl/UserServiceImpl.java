package com.ourshop.service.impl;

import org.springframework.stereotype.Repository;

import com.ourshop.bean.User;
import com.ourshop.service.UserService;

@Repository("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{

	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	public User queryByPhone(User user) {
		return userDao.queryByPhone(user);
	}

	
}
