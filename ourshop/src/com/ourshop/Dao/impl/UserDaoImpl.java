package com.ourshop.Dao.impl;


import org.springframework.stereotype.Repository;

import com.ourshop.Dao.UserDao;
import com.ourshop.bean.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	@Override
	public User login(User user) {
		String hql="from User u where u.phone=?	and u.password=?";
		System.out.println(user.getPhone()+"---"+user.getPassword());
		User dbuser=(User)getSession().createQuery(hql)
		.setString(0, user.getPhone())
		.setString(1,user.getPassword())
		.uniqueResult();
		System.out.println("login:dbuser"+dbuser);
		return dbuser;
	}

	@Override
	public User queryByPhone(User user) {
		String hql="from User u where u.phone=?";
		User dbuser=(User) getSession().createQuery(hql).setString(0, user.getPhone()).uniqueResult();
		return dbuser;
	}

	
}
