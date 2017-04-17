package com.ourshop.listener;

import java.util.Properties;
import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.ourshop.util.FileUpload;
import com.ourshop.util.impl.GetProperties;
import com.ourshop.util.impl.ProductTimerTask;

//项目启动时数据初始化
@WebListener
public class InitDataListener implements ServletContextListener {
	
	private ApplicationContext ctx=null;
	private ProductTimerTask productTimerTask=null;
	private FileUpload fileUpload=null;
	private int mesc;
	private int second;
	private int min;
	private int hour;

    public InitDataListener() {
    }

    public void contextInitialized(ServletContextEvent event)  { 
    	Properties properties=new Properties();
    	GetProperties.getPropertied("public.properties",properties);
    	mesc=Integer.parseInt(properties.getProperty("mesc"));
    	second=Integer.parseInt(properties.getProperty("second"));
    	min=Integer.parseInt(properties.getProperty("min"));
    	hour=Integer.parseInt(properties.getProperty("hour"));
    	int time=mesc*second*min*hour;
    	
    	//使用工具类
    	ctx=WebApplicationContextUtils.getWebApplicationContext(event.getServletContext());
    	productTimerTask=ctx.getBean(ProductTimerTask.class);
    	fileUpload=ctx.getBean(FileUpload.class);
    	//把内置对象交给productTimerTask
    	//通过设置定时器，让首页数据每隔一小时同步一次(要配置为守护线程)
    	productTimerTask.setApplication(event.getServletContext());
    	new Timer(true).schedule(productTimerTask, 0, time);
    	event.getServletContext().setAttribute("bankList", fileUpload.getBankImage());
    }

    public void contextDestroyed(ServletContextEvent event)  { 
    }
	
}
