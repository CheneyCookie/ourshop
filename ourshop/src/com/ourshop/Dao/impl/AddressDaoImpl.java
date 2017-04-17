package com.ourshop.Dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ourshop.Dao.AddressDao;
import com.ourshop.bean.Address;

@Repository("addressDao")
@SuppressWarnings("unchecked")
public class AddressDaoImpl extends BaseDaoImpl<Address> implements AddressDao{

	@Override
	public List<Address> queryJoinUser(int uid) {
		String hql="from Address a left join fetch a.user where a.user.id=?";
		List<Address> list=getSession().createQuery(hql).setInteger(0, uid).list();
		return list;
	}

	@Override
	public List<Address> queryTheLast(int uid) {
		String hql="select top 1 from Address a left join fetch a.user where a.user.id=? order by id desc";
		List<Address> list=getSession().createQuery(hql).setInteger(0, uid).list();
		return list;
	}
	
}
