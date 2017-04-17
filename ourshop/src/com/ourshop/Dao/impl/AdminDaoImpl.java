package com.ourshop.Dao.impl;

import org.springframework.stereotype.Repository;

import com.ourshop.Dao.AdminDao;
import com.ourshop.bean.Admin;

@Repository("adminDao")
public class AdminDaoImpl extends BaseDaoImpl<Admin> implements AdminDao{

	@Override
	public Admin login(Admin admin) {
		String hql="from Admin a where a.name=?	and a.password=?";
		Admin dbuser=(Admin)getSession().createQuery(hql)
		.setString(0, admin.getName())
		.setString(1,admin.getPassword())
		.uniqueResult();
		return dbuser;
	}


}
