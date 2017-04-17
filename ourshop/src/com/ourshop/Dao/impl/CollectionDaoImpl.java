package com.ourshop.Dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ourshop.Dao.CollectionDao;
import com.ourshop.bean.Collection;

@SuppressWarnings("unchecked")
@Repository("collectionDao")
public class CollectionDaoImpl extends BaseDaoImpl<Collection> implements CollectionDao {

	@Override
	public List<Collection> queryByUid(int uid) {
		String hql="from Collection c left join fetch c.user left join fetch c.product where c.user.id = ? ";
		List<Collection> list=getSession().createQuery(hql)
				.setInteger(0, uid).list();
		return list;
	}

}
