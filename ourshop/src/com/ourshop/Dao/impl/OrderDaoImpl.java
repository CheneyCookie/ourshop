package com.ourshop.Dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ourshop.Dao.OrderDao;
import com.ourshop.bean.Order;

@SuppressWarnings("unchecked")
@Repository("orderDao")
public class OrderDaoImpl extends BaseDaoImpl<Order> implements OrderDao {

	@Override
	public List<Order> queryByUid(int uid) {
		String hql="from Order o left join fetch o.user left join fetch o.status where o.user.id= ?";
		List<Order> list=getSession().createQuery(hql).setInteger(0, uid).list();
		return list;
	}

	@Override
	public List<Order> queryBypName(String pName,int page,int size) {
		String hql="from Order o left join fetch o.user left join fetch o.status where o.pName like ?";
		List<Order> list=getSession().createQuery(hql).setString(0, "%"+pName+"%")
				.setFirstResult((page-1)*size).setMaxResults(size).list();
		return list;
	}

	@Override
	public void deleteByIds(String ids) {
		String hql="delete from Order where id in ("+ ids +")";
		getSession().createQuery(hql).executeUpdate();
	}

	@Override
	public Long getCount(String pName) {
		String hql="select count(o) from Order o where o.pName like ?";
		Long count=(Long) getSession().createQuery(hql)
				.setString(0, "%"+pName+"%").uniqueResult();
		return count;
	}

	
	
}
