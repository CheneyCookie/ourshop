package com.ourshop.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.ourshop.Dao.AddressDao;
import com.ourshop.Dao.AdminDao;
import com.ourshop.Dao.BaseDao;
import com.ourshop.Dao.CategoryDao;
import com.ourshop.Dao.CollectionDao;
import com.ourshop.Dao.OrderDao;
import com.ourshop.Dao.ProductDao;
import com.ourshop.Dao.ShopCarDao;
import com.ourshop.Dao.StatusDao;
import com.ourshop.Dao.UserDao;
import com.ourshop.service.BaseService;

@SuppressWarnings({ "rawtypes", "unchecked" })
@Service("baseService")
@Lazy(true)
public class BaseServiceImpl<T> implements BaseService<T>{

	//如果当前T是account,则baseDao里面是accountDao,category则baseDao就是categoryDao
	protected BaseDao baseDao;
	
	@Autowired
	protected CategoryDao categoryDao;
	@Autowired
	protected ProductDao productDao;
	@Autowired
	protected UserDao userDao;
	@Autowired
	protected ShopCarDao shopCarDao;
	@Autowired
	protected CollectionDao collectionDao;
	@Autowired
	protected AdminDao adminDao;
	@Autowired
	protected AddressDao addressDao;
	@Autowired
	protected OrderDao orderDao;
	@Autowired
	protected StatusDao statusDao;
	
	private Class clazz;
	
	public BaseServiceImpl() {
		ParameterizedType type=(ParameterizedType) this.getClass().getGenericSuperclass();
		clazz=(Class) type.getActualTypeArguments()[0];
	}
	
	@PostConstruct
	public void init(){
		String className=clazz.getSimpleName();
		String classDao=className.substring(0,1)
				.toLowerCase()+className.substring(1)+"Dao";
		try {
			Field clazzField=this.getClass().getSuperclass().getDeclaredField(classDao);
//			System.out.println(clazzField+":0");
			Field baseField=this.getClass().getSuperclass().getDeclaredField("baseDao");
//			System.out.println(baseField+":1");
			baseField.set(this, clazzField.get(this));
//			System.out.println(baseField+":2");
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	@Override
	public void save(T t) {
//		System.out.println(t);
//		System.out.println(baseDao);
		baseDao.save(t);
	}

	@Override
	public void update(T t) {
		baseDao.update(t);
	}

	@Override
	public void delete(T t) {
		baseDao.delete(t);
	}

	@Override
	public T get(int id) {
		return (T) baseDao.get(id);
	}

	@Override
	public List<T> query() {
		return baseDao.query();
	}
	
}
