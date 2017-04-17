package com.ourshop.service;

import com.ourshop.bean.Admin;

public interface AdminService extends BaseService<Admin>{
	Admin login(Admin admin);
}
