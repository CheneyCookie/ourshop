package com.ourshop.util.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ourshop.bean.Category;
import com.ourshop.bean.Product;
import com.ourshop.service.CategoryService;
import com.ourshop.service.ProductService;

@Component("productTimerTask")
public class ProductTimerTask extends TimerTask{
	
	@Autowired
	private ProductService productService=null;
	@Autowired
	private CategoryService categoryService=null;
	
	private ServletContext application=null;
	
	public void setApplication(ServletContext application) {
		this.application = application;
	}

	@Override
	public void run() {
		List<List<Product>> bigList=new ArrayList<List<Product>>();
		List<Category> categories=categoryService.query();
		application.setAttribute("categories", categories);
		//查询类别
		for(Category category:categories){
			List<Product> products=productService.queryByCid(category.getId());
			bigList.add(products);
		}
		//把查询的bigList交给application内置对象
    	application.setAttribute("bigList", bigList);
	}

}
