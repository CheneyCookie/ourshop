package com.ourshop.action;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ourshop.bean.Product;
import com.ourshop.bean.ShopCar;
import com.ourshop.bean.User;


@Controller
@Scope("prototype")
public class ShopCarAction extends BaseAction<ShopCar>{

	private static final long serialVersionUID = 1L;
	
	public String add(){
		User user=(User) session.get("user");
		System.out.println("----shopCar:"+model.getProduct().getId()+",number:"+model.getNumber());
		Product product=productService.getJoinFetchCategory(model.getProduct().getId());
		System.out.println("----shopCar"+product);
		List<ShopCar> shopCars=shopCarService.queryByUid(user.getId());
		boolean flag=false;
		int oldNumber=0;
		int oldId=0;
		for(ShopCar shopCar:shopCars){
			if(shopCar.getProduct().getId()==product.getId()){
				oldNumber=shopCar.getNumber();
				oldId=shopCar.getId();
				flag=true;
			}
		}
		System.out.println("不知道");
		System.out.println(flag);
		ShopCar shopCar=new ShopCar();
		shopCar.setProduct(product);
		shopCar.setUser((User) session.get("user"));
		//把商品转化为购物车
		if(flag==false){
			shopCar.setNumber(model.getNumber());
			shopCarService.save(shopCar);
		}else{
			shopCar.setId(oldId);
			shopCar.setNumber(model.getNumber()+oldNumber);
			shopCarService.update(shopCar);
		}
		List<ShopCar> shopCars2=shopCarService.queryByUid(user.getId());
		session.put("shopCars", shopCars2);
		inputStream=new ByteArrayInputStream("true".getBytes());
		return "stream";
	}
	
	public String queryByUid(){
		List<ShopCar> shopCars=shopCarService.queryByUid(((User) session.get("user")).getId());
		session.put("shopCars", shopCars);
		return "query";
	}
	
	public String delete(){
		shopCarService.delete(model);
		List<ShopCar> shopCars=shopCarService.queryByUid(((User) session.get("user")).getId());
		session.put("shopCars", shopCars);
		inputStream=new ByteArrayInputStream("true".getBytes());
		return "stream";
	}
	
	public void updateNum(){
		ShopCar shopCar=shopCarService.get(model.getId());
		shopCar.setNumber(model.getNumber());
		shopCarService.update(shopCar);
		List<ShopCar> shopCars=shopCarService.queryByUid(((User) session.get("user")).getId());
		session.put("shopCars", shopCars);
//		BigDecimal total=shopCar.getProduct().getPrice().multiply(new BigDecimal(shopCar.getNumber()));
//		String pricr_num=total.toString();
//		inputStream=new ByteArrayInputStream(pricr_num.getBytes());
//		return "stream";
	}
	
	public String deleteByIds(){
		shopCarService.deleteByIds(ids);
		inputStream=new ByteArrayInputStream("true".getBytes());
		return "stream";
	}
	
	public void addToOrder(){
		User user=(User) session.get("user");
		List<ShopCar> order_shopCars=shopCarService.queryAddToOrder(ids,user.getId());
		session.put("order_shopCars", order_shopCars);
		
	}
	
	public void buyRightNow(){
		User user=(User) session.get("user");
		//ShopCar shopCar=new ShopCar();
		//shopCar.setNumber(model.getNumber());
		//shopCar.setUser(user);
		Product product=productService.get(model.getId());
		//shopCar.setProduct(product);
		model.setProduct(product);
		model.setUser(user);
		List<ShopCar> order_shopCars=new ArrayList<ShopCar>();
		order_shopCars.add(model);
		session.put("order_shopCars", order_shopCars);
		
	}
	
}
