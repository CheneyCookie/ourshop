package com.ourshop.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ourshop.bean.Admin;

@Controller
@Scope("prototype")
public class AdminAction extends BaseAction<Admin> {

	private static final long serialVersionUID = 1L;

	public String login() {

		System.out.println("model---" + model);
		model = adminService.login(model);
		if (model == null) {
			return "alogin";
		} else {
			session.put("admin", model);
			return "aindex";
		}
	}

	public String toLogin() {
		Admin admin = (Admin) session.get("admin");
		if (admin != null) {
			System.out.println("admin---" + admin);
			return "aindex";
		} else {
			return "alogin";
		}

	}
}
