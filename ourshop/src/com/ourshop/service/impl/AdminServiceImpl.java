package com.ourshop.service.impl;


import org.springframework.stereotype.Service;

import com.ourshop.bean.Admin;
import com.ourshop.service.AdminService;

@Service("adminService")
public class AdminServiceImpl extends BaseServiceImpl<Admin> implements AdminService{

	@Override
	public Admin login(Admin admin) {
		return adminDao.login(admin);
	}


}
