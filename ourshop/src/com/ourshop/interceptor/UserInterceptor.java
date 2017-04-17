package com.ourshop.interceptor;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.ourshop.bean.User;

public class UserInterceptor extends MethodFilterInterceptor{

	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();
		User user=(User) request.getSession().getAttribute("user");
		System.out.println("---拦截器");
		if(user==null){
//			String param=request.getQueryString();
//			if(param!=null){
//				goURL=goURL+"?"+param;
//			}
//			String goUrl1=request.getRealPath("/");
//			String goUrl2=request.getContextPath();
//			String goUrl3=request.getRequestURI();
//			System.out.println(request.getParameter(goUrl1));
//			System.out.println("goUrl1:"+goUrl1);
//			System.out.println("goUrl2:"+goUrl2);
//			System.out.println("goUrl3:"+goUrl3);
//			System.out.println("---拦截器1");
			return "unlogin";
		}
		
		return arg0.invoke();
	}

	
}
