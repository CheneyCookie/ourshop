package com.ourshop.action;


import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ourshop.bean.Order;
import com.ourshop.bean.ShopCar;
import com.ourshop.bean.Status;
import com.ourshop.bean.User;

@Controller
@Scope("prototype")
@SuppressWarnings("unchecked")
public class OrderAction extends BaseAction<Order>{

	private static final long serialVersionUID = 1L;

	public void save(){
		User user= (User) session.get("user");
		String pid="";
		String pname="";
		String price="";
		String pnumber="";
		String pPicture="";
		List<ShopCar> shopCars=(List<ShopCar>) session.get("order_shopCars");
		
		for(ShopCar shopCar:shopCars){
			pid=pid+","+shopCar.getId();
			pname=pname+","+shopCar.getProduct().getName();
			price=price+","+shopCar.getProduct().getPrice();
			pnumber=pnumber+","+shopCar.getNumber();
			pPicture=pPicture+","+shopCar.getProduct().getPicture();
			shopCarService.delete(shopCar);
		}
		pid=pid.substring(1);
		pname=pname.substring(1);
		price=price.substring(1);
		pnumber=pnumber.substring(1);
		pPicture=pPicture.substring(1);
//		System.out.println(pid);
		model.setpId(pid);
		model.setpName(pname);
		model.setpPrice(price);
		model.setpNumber(pnumber);
		model.setpPicture(pPicture);
		model.setUser(user);
		model.setStatus(new Status(1));
		orderService.save(model);
		session.put("old_order_shopCars",session.remove("order_shopCars"));
		session.put("order", model);
		System.out.println(model);
	}
	
	public String queryByUid(){
		User user=(User) session.get("user");
		List<Order> orderList=orderService.queryByUid(user.getId());
		List<Order> detailOrderList=new ArrayList<Order>();
		for(Order order:orderList){
			String pid=order.getpId();
			String pname=order.getpName();
			String pnumber=order.getpNumber();
			String picture=order.getpPicture();
			String price=order.getpPrice();
			String[] npid=pid.split(",");
			String[] name=pname.split(",");
			String[] number=pnumber.split(",");
			String[] npicture=picture.split(",");
			String[] nprice=price.split(",");
			for(int i=0;i<npid.length;i++){
				Order order2=new Order();
				order2=order;
				order2.setpId(npid[i]);
				order2.setpName(name[i]);
				order2.setpNumber(number[i]);
				order2.setpPicture(npicture[i]);
				order2.setpPrice(nprice[i]);
				detailOrderList.add(order2);
			}
			
		}
		session.put("orderList", detailOrderList);
		return "myorder";
	}
	
	public String queryBypName(){
		System.out.println(model);
		pageMap=new HashMap<String, Object>();
		System.out.println("order_query");
		List<Order> orderlList=orderService.queryBypName(model.getName(), page, rows);
		System.out.println("model.getpName()"+model.getpName()+"page"+page+"rows"+rows);
		System.out.println(orderlList);
		pageMap.put("rows", orderlList);
		System.out.println("order_rows");
		Long count =orderService.getCount(model.getName());
		System.out.println(count);
		pageMap.put("total", count);
		return "jsonMap";
	}
	
	public String deleteByIds(){
		orderService.deleteByIds(ids);
		inputStream=new ByteArrayInputStream("true".getBytes());
		return "stream";
	}
	
	public void update(){
		Order order=orderService.get(model.getId());
		order.setStatus(model.getStatus());
		orderService.update(order);
	}
}
