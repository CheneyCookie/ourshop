package com.ourshop.action;

import java.io.ByteArrayInputStream;




import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ourshop.bean.User;

@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User>{

	private static final long serialVersionUID = 1L;

	public String login(){
		System.out.println("user login登录");
		System.out.println(remeber);
		//进行登陆判断
		System.out.println("user:----- model"+model);
		model=userService.login(model);
		if(model==null){
			session.put("error", "登陆失败");
			System.out.println("登录失败");
			inputStream=new ByteArrayInputStream("false".getBytes());
			return "ulogin";
		}else{
			//登陆成功，先存储到session,则根据情况返回相应的页面
			session.put("user", model);
			System.out.println("session----");
			
			System.out.println(remeber);
			if(remeber!=null&&remeber.equals("on")){
				String val1=null;
				String val2=null;
				try {
					val1 = URLEncoder.encode(model.getName(),"UTF-8");
					val2 = URLEncoder.encode(model.getPassword(),"UTF-8");
				} catch (UnsupportedEncodingException e) {
					throw new RuntimeException();
				}
				Cookie cookie1=new Cookie("user", val1);
				Cookie cookie2=new Cookie("passord", val2);
				cookie1.setPath("/");
				cookie2.setPath("/");
				cookie1.setMaxAge(60*60*24*7);
				cookie2.setMaxAge(60*60*24*7);
				System.out.println("before---");
				ServletActionContext.getResponse().addCookie(cookie1);
				ServletActionContext.getResponse().addCookie(cookie2);
				System.out.println("cookie----");
			}
			
			//cookie.put("user", model.getName());
			//根据session中goURL是否有值而决定页面的跳转
			if(session.get("goURL")==null){
				System.out.println("登录成功");
				inputStream=new ByteArrayInputStream("true".getBytes());
				return "index";
			}else{
				return "goURL";
			}
		}
	}
	
	public String register(){
		userService.save(model);
		session.put("user", model);
		return "register";
	}
	
	public String checkPhone(){
		User user=userService.queryByPhone(model);
		
		if(user==null){
			inputStream=new ByteArrayInputStream("true".getBytes());
		}else{
			inputStream=new ByteArrayInputStream("false".getBytes());
		}
		return "stream";
	}
	
	public String checkcode(){
		String imgcode=((String) ServletActionContext.getRequest().getSession().getAttribute("imgcode")).toLowerCase();
		checkcode=checkcode.toLowerCase();
		if(imgcode.equals(checkcode)){
			inputStream=new ByteArrayInputStream("true".getBytes());
//			System.out.println("true");
		}else{
			inputStream=new ByteArrayInputStream("false".getBytes());
//			System.out.println("false");
		}
//		System.out.println("checkcode:"+checkcode);
//		System.out.println("imgcode:"+imgcode);
		return "stream";
	}
	
	public String out(){
		session.remove("user");
		
		return "index";
	}
	
	public void updateName(){
		User user=(User) session.get("user");
		user.setLogin(model.getLogin());
		userService.update(user);
		System.out.println(user);
		session.put("user", user);
	}
	
	public void updatePhone(){
		User user=(User) session.get("user");
		user.setPhone(model.getPhone());
		System.out.println(user);
		userService.update(user);
		session.put("user", user);
	}
	
	public void updateEmail(){
		User user=(User) session.get("user");
		user.setEmail(model.getEmail());
		userService.update(user);
		session.put("user", user);
	}
}
