package com.ourshop.bean;

import java.io.Serializable;
import java.util.Date;

public class Collection implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	private Date date;
	private Product product;
	private User user;

	public Collection() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
}
