package com.ourshop.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ourshop.bean.Address;
import com.ourshop.bean.User;

@Controller
@Scope("prototype")
public class AddressAction extends BaseAction<Address>{

	private static final long serialVersionUID = 1L;
	
	public void save(){
		System.out.println("address");
		User user=(User) session.get("user");
		model.setUser(user);
		addressService.save(model);
//		jsonList.add(model);
//		System.out.println("save model---:"+model);
	}
	
	public void queryJoinUser(){
		User user=(User) session.get("user");
		List<Address> addressList=addressService.queryJoinUser(user.getId());
		session.put("addressList", addressList);
	}
	
	public void update(){
		User user=(User) session.get("user");
		model.setUser(user);
		System.out.println("update:"+model);
		addressService.update(model);
		List<Address> addressList=addressService.queryJoinUser(user.getId());
		session.put("addressList", addressList);
	}

	public void delete(){
		User user=(User) session.get("user");
		addressService.delete(model);
		List<Address> addressList=addressService.queryJoinUser(user.getId());
		session.put("addressList", addressList);
	}
}
