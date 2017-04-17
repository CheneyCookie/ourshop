package ourshop;


import java.math.BigDecimal;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ourshop.bean.Category;
import com.ourshop.bean.Order;
import com.ourshop.bean.Product;
import com.ourshop.bean.ShopCar;
import com.ourshop.bean.Status;
import com.ourshop.service.CategoryService;
import com.ourshop.service.OrderService;
import com.ourshop.service.ProductService;
import com.ourshop.service.ShopCarService;
import com.ourshop.service.StatusService;

public class TestSH {

	private ApplicationContext ctx;
	private CategoryService categoryService;
	private ProductService productService;
	private ShopCarService shopCarService;
	private OrderService orderService;
	private StatusService statusService;
	@Value("#{prop.basePath+prop.filePath}")
	private String filePath;
	@Value("#{prop.timerTask}")
	private int time;
	
	{
		ctx=new ClassPathXmlApplicationContext("applicationContext*.xml");
		categoryService=ctx.getBean(CategoryService.class);
		productService=ctx.getBean(ProductService.class);
		shopCarService=ctx.getBean(ShopCarService.class);
		orderService=ctx.getBean(OrderService.class);
		statusService=ctx.getBean(StatusService.class);
	}
	
	@Test
	public void testCategorySave() {
		Category category=new Category();
		category.setId(1);
		category.setType("球鞋");
		categoryService.save(category);
	}
	
	
	@Test
	public void testQueryJoinCategory(){
		List<Product> list=productService.queryJoinCategory("", 1, 2);
		System.out.println(list);
	}

	@Test
	public void testQueryByCid(){
		List<Product> list=productService.queryByCid(1);
		System.out.println(list);
	}
	
	@Test
	public void testTimerTask(){
		System.out.println(time);
		System.out.println(filePath);
	}
	
	@Test
	public void testProductByCategory(){
		List<Product> products=productService.queryAllByCid(1);
		System.out.println(products);
	}
	
	@Test
	public void testSubString(){
		String a="商品asda";
		int length=a.length();
		System.out.println(length);
		String b="";
		for(int i=0;i<length;i++){
			 b+=a.substring(i,i+1)+"%";
		}
		System.out.println(b);
	}
	
	@Test
	public void testSplit(){
		String[] a="asaf,dsafsd,rhtrt".split(",");
		for(int i=0;i<a.length;i++){
			System.out.println(a[i]);
		}
	}
	
	@Test
	public void testProductGet(){
		Product product=productService.get(1);
		System.out.println(product);
	}
	
	@Test
	public void testShopCarQuery(){
		List<ShopCar> list=shopCarService.queryByUid(1);
		System.out.println(list);
	}
	
	@Test
	public void testShopCardelete(){
		shopCarService.deleteByIds("73");
	}
	
	
	
	@Test
	public void testOrderGet(){
		Order order=orderService.get(2017000001);
		System.out.println(order);
	}
	
	
	
	@Test
	public void testOrder(){
		Order order=new Order();
		order.setTotal(new BigDecimal(1000));
		orderService.save(order);
	}
	
	@Test
	public void testOrderPhoneCount(){
		Long count =orderService.getCount("");
		System.out.println(count);
	}
	
	@Test
	public void testOrderPName(){
		List<Order> list =orderService.queryBypName("", 1, 2);
		System.out.println(list);
	}
	
	@Test
	public void testStatus(){
		List<Status> status=statusService.query();
		System.out.println(status);
	}
	
	
}
