package com.ourshop.bean;

import java.io.Serializable;

//购物车，一个用户多个购物车
public class ShopCar implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	private Integer number;
	private Product product;
	private User user;

	public ShopCar() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "ShopCar [id=" + id + ", number=" + number + ", product="
				+ product + ", user=" + user + "]";
	}

}
