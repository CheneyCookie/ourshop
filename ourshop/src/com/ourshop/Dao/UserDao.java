package com.ourshop.Dao;

import com.ourshop.bean.User;

public interface UserDao extends BaseDao<User>{
	User login(User user);
	
	User queryByPhone(User user);
	
}
