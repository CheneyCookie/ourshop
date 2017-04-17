package com.ourshop.Dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ourshop.Dao.ProductDao;
import com.ourshop.bean.Product;

@SuppressWarnings("unchecked")
@Repository("productDao")
public class ProductDaoImpl extends BaseDaoImpl<Product> implements ProductDao{

	@Override
	public List<Product> queryJoinCategory(String name, int page, int size) {
		String hql="from Product p left join fetch p.category where p.name like ?";
		List<Product> list=getSession().createQuery(hql)
				.setString(0, "%"+name+"%")
				.setFirstResult((page-1)*size)
				.setMaxResults(size).list();
		return list;
	}

	@Override
	public Long getCount(String name) {
		String hql="select count(p) from Product p where p.name like ?";
		Long count=(Long) getSession().createQuery(hql)
				.setString(0, "%"+name+"%").uniqueResult();
		return count;
	}

	@Override
	public void deleteByIds(String ids) {
		String hql="delete from Product where id in ("+ids+")";
		getSession().createQuery(hql).executeUpdate();
	}

	@Override
	public List<Product> queryByCid(int cid) {
		String hql="from Product p join fetch p.category where p.commend=true and p.hot=true and p.number !=0 and p.category.id=? order by p.date desc";
		List<Product> products=getSession().createQuery(hql)
				.setInteger(0, cid).setFirstResult(0)
				.setMaxResults(4).list();
		return products;
	}

	@Override
	public List<Product> queryAllByCid(int cid) {
		String hql="from Product p join fetch p.category where p.commend=true and p.hot=true and p.number !=0 and p.category.id=? order by p.date desc";
		List<Product> products=getSession().createQuery(hql)
				.setInteger(0, cid).list();
		return products;
	}

	@Override
	public List<Product> queryBySearch(String search) {
		String hql1="from Product p join fetch p.category where p.number !=0 and p.name like ? order by p.date desc";
		String hql2="from Product p join fetch p.category where p.number !=0 and p.remark like ? order by p.date desc";
		int length=search.length();
		String a="%";
		for(int i=0;i<length;i++){
			a+=search.substring(i,i+1)+"%";
		}
		System.out.println(a);
		List<Product> list1=getSession().createQuery(hql1)
				.setString(0, a).list();
		List<Product> list2=getSession().createQuery(hql2)
				.setString(0, a).list();
		list1.addAll(list2);
		return list1;
	}

	@Override
	public List<Product> queryByScrollLine(int line, int cid) {
		String hql="from Product p join fetch p.category where p.number !=0 and p.category.id = ? order by p.date desc";
		List<Product> list=getSession().createQuery(hql)
				.setInteger(0, cid).setFirstResult(2+line)
				.setMaxResults(2).list();
		return list;
	}

	@Override
	public Product getJoinFetchCategory(int id) {
		String hql="from Product p left join fetch p.category where p.id=?";
		Product product=(Product) getSession().createQuery(hql)
				.setInteger(0, id).uniqueResult();
		return product;
	}
	
	
	
}
