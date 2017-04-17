package com.ourshop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/user/*")
public class UserFilter implements Filter {

    public UserFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//判断当前session是否有用户信息
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		if(req.getSession().getAttribute("user")==null){
			//保存当前客户想要去的url地址
			//System.out.println(req.getRealPath("/"));
			String goURL=req.getServletPath();
			//System.out.println(req.getContextPath());
			String param=req.getQueryString();
			if(param!=null){
				goURL=goURL+"?"+param;
			}
			System.out.println(goURL);
			//把当前客户想要访问的地址存储到session中
			req.getSession().setAttribute("goURL", goURL);
			res.sendRedirect(req.getContextPath()+"/login.jsp");
		}else{
			//如果有下有一个过滤器则跳转，否则直接到目标页面
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
