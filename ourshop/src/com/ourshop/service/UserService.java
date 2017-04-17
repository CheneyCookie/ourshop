package com.ourshop.service;

import com.ourshop.bean.User;

public interface UserService extends BaseService<User>{
	
	public User login(User user);
	
	public User queryByPhone(User user);
	
}
