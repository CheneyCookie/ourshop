package com.ourshop.action;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ourshop.bean.Status;

@Controller("statusAction")
@Scope("prototype")
public class StatusAction extends BaseAction<Status>{

	private static final long serialVersionUID = 1L;

	public String query(){
		System.out.println("status");
		jsonList=statusService.query();
		return "jsonList";
	}
}
