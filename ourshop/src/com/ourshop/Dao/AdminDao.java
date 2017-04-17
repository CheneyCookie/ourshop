package com.ourshop.Dao;

import com.ourshop.bean.Admin;

public interface AdminDao extends BaseDao<Admin>{
	Admin login(Admin admin);
}
