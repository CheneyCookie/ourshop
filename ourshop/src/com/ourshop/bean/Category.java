package com.ourshop.bean;

import java.io.Serializable;

//类别
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String type;

	public Category() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", type=" + type + "]";
	}

}
