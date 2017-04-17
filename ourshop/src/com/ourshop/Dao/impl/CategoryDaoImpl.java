package com.ourshop.Dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ourshop.Dao.CategoryDao;
import com.ourshop.bean.Category;

@Repository("categoryDao")
public class CategoryDaoImpl extends BaseDaoImpl<Category> implements CategoryDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> queryFuzzy(String type, int page, int size) {
		String hql="from Category where type like ?";
		List<Category> list=getSession().createQuery(hql)
				.setString(0, "%"+type+"%")
				.setFirstResult((page-1)*size)//第一页从第0个开始，第二页从第size个开始
				.setMaxResults(size).list();
		return list;
	}

	@Override
	public Long getCount(String type) {
		String hql="select count(c) from Category c where type like ?";
		Long count= (Long) getSession().createQuery(hql)
				.setString(0, "%"+type+"%").uniqueResult();
		return count; 
	}

	@Override
	public void deleteByIds(String ids) {
		String hql="delete from Category where id in ("+ids+")";
		getSession().createQuery(hql).executeUpdate();
	}

	@Override
	public Integer queryIdByType(String type) {
		System.out.println("type---"+type);
		String hql="select c.id from Category c where c.type=?";
		Integer id= (Integer) getSession().createQuery(hql).setString(0, type).uniqueResult();
		System.out.println("id---"+id);
		int cid = id;
		return cid;
	}
	
}
