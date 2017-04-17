package com.ourshop.bean;

import java.io.Serializable;

//订单状态表
public class Status implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String status;
	
	
	public Status(Integer id) {
		super();
		this.id = id;
	}
	public Status() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Status [id=" + id + ", status=" + status + "]";
	}
	
}
