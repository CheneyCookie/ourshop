package com.ourshop.action;

import java.io.ByteArrayInputStream;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ourshop.bean.Collection;
import com.ourshop.bean.Product;
import com.ourshop.bean.User;

@Controller
@Scope("prototype")
public class CollectionAction extends BaseAction<Collection>{

	private static final long serialVersionUID = 1L;

	public String add(){
		User user=(User) session.get("user");
		System.out.println("coollection-add----");
		Product product=productService.getJoinFetchCategory(model.getProduct().getId());
		List<Collection> collections=collectionService.queryByUid(user.getId());
		boolean flag=false;
		for(Collection collection:collections){
			if(collection.getProduct().getId()==product.getId()){
				flag=true;
			}
		}
		
		if(flag==false){
			Collection collection=new Collection();
			collection.setProduct(product);
			collection.setUser(user);
			collectionService.save(collection);
			
		}else{
			
		}
		inputStream=new ByteArrayInputStream("true".getBytes());
		return "stream";
	}
	
	public void queryByUid(){
		System.out.println("collec");
		User user=(User) session.get("user");
		List<Collection> collections=collectionService.queryByUid(user.getId());
		session.put("collections", collections);
	}
	
	public void delete(){
		User user=(User) session.get("user");
		collectionService.delete(model);
		List<Collection> collections=collectionService.queryByUid(user.getId());
		session.put("collections", collections);
	}
}
