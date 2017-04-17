package com.ourshop.Dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ourshop.Dao.ShopCarDao;
import com.ourshop.bean.ShopCar;

@Repository("shopCarDao")
@SuppressWarnings("unchecked")
public class ShopCarDaoImpl extends BaseDaoImpl<ShopCar> implements ShopCarDao{

	@Override
	public List<ShopCar> queryByUid(int uid) {
		String hql="from ShopCar s left join fetch s.user left join fetch s.product where s.user.id = ? ";
		List<ShopCar> list=getSession().createQuery(hql)
				.setInteger(0, uid).list();
		return list;
	}

	@Override
	public void deleteByIds(String ids) {
		String hql="delete from ShopCar where id in ("+ids+")";
		getSession().createQuery(hql).executeUpdate();
	}

	@Override
	public List<ShopCar> queryAddToOrder(String ids,int uid) {
		String hql="from ShopCar s join fetch s.user join fetch s.product where s.id in ("+ids+") and s.user.id=?";
		List<ShopCar> list=getSession().createQuery(hql).setInteger(0, uid).list();
		return list;
	}

}
