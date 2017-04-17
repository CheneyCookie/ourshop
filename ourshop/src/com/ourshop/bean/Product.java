package com.ourshop.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Product implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	private String name;
	private BigDecimal price;
	//库存
	private Long number;
	private String remark;
	private Date date;
	// 是否为推荐商品，推荐商品才有可能显示在商城首页
	private Boolean commend;
	// 是否为热卖商品
	private Boolean hot;
	private Category category;
	private String picture;
	//详细图片
	private String detailPic;
	//内容图片
	private String remarkPic;
	

	public Product() {
		super();
	}

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

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
		this.number = number;
	}


	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Boolean getCommend() {
		return commend;
	}

	public void setCommend(Boolean commend) {
		this.commend = commend;
	}

	public Boolean getHot() {
		return hot;
	}

	public void setHot(Boolean hot) {
		this.hot = hot;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getDetailPic() {
		return detailPic;
	}

	public void setDetailPic(String detailPic) {
		this.detailPic = detailPic;
	}

	public String getRemarkPic() {
		return remarkPic;
	}

	public void setRemarkPic(String remarkPic) {
		this.remarkPic = remarkPic;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price
				+ ", number=" + number + ", remark=" + remark + ", date="
				+ date + ", commend=" + commend + ", hot=" + hot
				+ ", category=" + category + ", picture=" + picture
				+ ", detailPic=" + detailPic + ", remarkPic=" + remarkPic + "]";
	}

}
