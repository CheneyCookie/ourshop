package com.ourshop.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ourshop.bean.Product;
import com.ourshop.service.ProductService;

@Service("productService")
public class ProductServiceImpl extends BaseServiceImpl<Product> implements ProductService{

	@Override
	public List<Product> queryJoinCategory(String name, int page, int size) {
		return productDao.queryJoinCategory(name, page, size);
	}

	@Override
	public Long getCount(String name) {
		return productDao.getCount(name);
	}

	@Override
	public void deleteByIds(String ids) {
		productDao.deleteByIds(ids);
	}

	@Override
	public List<Product> queryByCid(int cid) {
		return productDao.queryByCid(cid);
	}

	@Override
	public List<Product> queryAllByCid(int cid) {
		return productDao.queryAllByCid(cid);
	}

	@Override
	public List<Product> queryBySearch(String search) {
		return productDao.queryBySearch(search);
	}

	@Override
	public List<Product> queryByScrollLine(int line, int cid) {
		return productDao.queryByScrollLine(line, cid);
	}

	@Override
	public Product getJoinFetchCategory(int id) {
		return productDao.getJoinFetchCategory(id);
	}


}
