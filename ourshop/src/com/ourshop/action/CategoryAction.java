package com.ourshop.action;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ourshop.bean.Category;

@Controller
@Scope("prototype")
public class CategoryAction extends BaseAction<Category>{

	private static final long serialVersionUID = 1L;
	
	//模糊查询
	public String fuzzyQuery(){
		pageMap=new HashMap<String, Object>();
		List<Category> categoryList=categoryService.queryFuzzy(model.getType(), page, rows);
		pageMap.put("rows", categoryList);
		//根据关键字查询总记录数
		Long total=categoryService.getCount(model.getType());
		pageMap.put("total", total);
		return "jsonMap";
	}
	
	public String deleteByIds(){
		categoryService.deleteByIds(ids);
		inputStream=new ByteArrayInputStream("true".getBytes());
		return "stream";
	}
	
	public void save(){
		categoryService.save(model);
	}
	
	public void update(){
		System.out.println(model);
		categoryService.update(model);
		System.out.println("out");
	}

	public String query(){
		jsonList=categoryService.query();
		return "jsonList";
	}
	
}
