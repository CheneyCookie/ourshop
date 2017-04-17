package com.ourshop.bean;

import java.io.Serializable;

//收货信息
public class Address implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	//收货人
	private String name;
	//收货人手机
	private String phone;
	//地址名
	private String addName;
	private User user;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddName() {
		return addName;
	}

	public void setAddName(String addName) {
		this.addName = addName;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", name=" + name + ", phone=" + phone
				+ ", addName=" + addName + ", user=" + user + "]";
	}

}
