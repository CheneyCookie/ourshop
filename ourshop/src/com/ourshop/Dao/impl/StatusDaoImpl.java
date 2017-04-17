package com.ourshop.Dao.impl;

import org.springframework.stereotype.Repository;

import com.ourshop.Dao.StatusDao;
import com.ourshop.bean.Status;

@Repository("statusDao")
public class StatusDaoImpl extends BaseDaoImpl<Status> implements StatusDao{

}
