package com.ourshop.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

//订单
public class Order implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	//商品id数组
	private String pId;
	//商品名数组
	private String pName;
	//商品单价数组
	private String pPrice;
	//商品数量数组
	private String pNumber;
	//商品图片数组
	private String pPicture;
	//收货信息
	private String address;
	private String name;
	private String phone;
	// 订单总价
	private BigDecimal total;
	// 买家留言
	private String message;
	// 订单生成时间
	private Date date;
	//所属用户
	private User user;
	//订单状态
	private Status status;

	public Order() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}


	public String getpPrice() {
		return pPrice;
	}

	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}

	public String getpNumber() {
		return pNumber;
	}

	public void setpNumber(String pNumber) {
		this.pNumber = pNumber;
	}

	public String getpPicture() {
		return pPicture;
	}

	public void setpPicture(String pPicture) {
		this.pPicture = pPicture;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	@Override
	public String toString() {
		return "Order [id=" + id + ", pId=" + pId + ", pName=" + pName
				+ ", pPrice=" + pPrice + ", pNumber=" + pNumber + ", pPicture="
				+ pPicture + ", address=" + address + ", name=" + name
				+ ", phone=" + phone + ", total=" + total + ", message="
				+ message + ", date=" + date + ", user=" + user + ", status="
				+ status + "]";
	}



	
}
