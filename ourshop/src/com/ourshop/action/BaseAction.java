package com.ourshop.action;

import java.io.File;
import java.io.InputStream;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ourshop.service.AddressService;
import com.ourshop.service.AdminService;
import com.ourshop.service.CategoryService;
import com.ourshop.service.CollectionService;
import com.ourshop.service.OrderService;
import com.ourshop.service.ProductService;
import com.ourshop.service.ShopCarService;
import com.ourshop.service.StatusService;
import com.ourshop.service.UserService;
import com.ourshop.util.FileUpload;

@SuppressWarnings({ "unchecked", "rawtypes" })
@Controller
@Scope("prototype")
public class BaseAction<T> extends ActionSupport implements RequestAware,SessionAware,ApplicationAware,ModelDriven<T>{

	private static final long serialVersionUID = 1L;
	
	//很多属性需要get和set方法
	protected Map<String, Object> request;
	protected Map<String, Object> session;
	protected Map<String, Object> application;
	protected T model;
	protected Integer page;
	protected Integer rows;
	protected File fileImage;
	protected File[] detailImage;
	protected File[] remarkImage;
	protected List<T> jsonList=null;
	protected Map<String, Object> pageMap=null;
	@Autowired
	protected FileUpload fileUpload;
	@Autowired
	protected CategoryService categoryService;
	@Autowired
	protected ProductService productService;
	@Autowired
	protected UserService userService;
	@Autowired
	protected ShopCarService shopCarService;
	@Autowired
	protected CollectionService collectionService;
	@Autowired
	protected AdminService adminService;
	@Autowired
	protected AddressService addressService;
	@Autowired
	protected OrderService orderService;
	@Autowired
	protected StatusService statusService;
	//获取要删除的id
	protected String ids;
	protected InputStream inputStream;
	//获取要查询商品类别名称
	protected String categoryName;
	//验证码
	protected String checkcode;
	//记住密码
	protected String remeber;
	//下拉查询行
	protected Integer line;

	
	public String getCheckcode() {
		return checkcode;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	@Override
	public T getModel() {
		ParameterizedType type=(ParameterizedType) this.getClass().getGenericSuperclass();
		Class clazz=(Class) type.getActualTypeArguments()[0];
		try {
			model=(T) clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return model;
	}

	@Override
	public void setApplication(Map<String, Object> arg0) {
		this.application=arg0;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session=arg0;
	}

	@Override
	public void setRequest(Map<String, Object> arg0) {
		this.request=arg0;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	public List<T> getJsonList() {
		return jsonList;
	}
	
	public Map<String, Object> getPageMap() {
		return pageMap;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
	
	public InputStream getInputStream() {
		return inputStream;
	}


	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getRemeber() {
		return remeber;
	}

	public void setRemeber(String remeber) {
		this.remeber = remeber;
	}

	public Integer getLine() {
		return line;
	}

	public void setLine(Integer line) {
		this.line = line;
	}

	public File getFileImage() {
		return fileImage;
	}

	public void setFileImage(File fileImage) {
		this.fileImage = fileImage;
	}

	public File[] getDetailImage() {
		return detailImage;
	}

	public void setDetailImage(File[] detailImage) {
		this.detailImage = detailImage;
	}

	public File[] getRemarkImage() {
		return remarkImage;
	}

	public void setRemarkImage(File[] remarkImage) {
		this.remarkImage = remarkImage;
	}

}


