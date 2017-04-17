package com.ourshop.action;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.ourshop.bean.Category;
import com.ourshop.bean.Product;

@Controller
@Scope("prototype")
public class ProductAction extends BaseAction<Product>{

	private static final long serialVersionUID = 1L;

	public String queryJoinCategory(){
		pageMap=new HashMap<String, Object>();
		//根据关键字和分页的参数查询相应的数据
		List<Product> productList=productService.queryJoinCategory(model.getName(), page, rows);
		pageMap.put("rows", productList);
		//根据关键字查询总记录数
		Long count=productService.getCount(model.getName());
		pageMap.put("total", count);
		return "jsonMap";
	}
	
	public String deleteByIds(){
		productService.deleteByIds(ids);
		inputStream=new ByteArrayInputStream("true".getBytes());
		return "stream";
	}
	
	public void save(){
		System.out.println("我也很绝望啊");
	//	System.out.println("----文件上传");
		//System.out.println("fileImage"+fileImage);
		String pic=fileUpload.uploadFile(fileImage);
		model.setPicture(pic);
		String dp="";
		String rp="";
		for(int i=0;i<detailImage.length;i++){
			String pict=fileUpload.uploadFile(detailImage[i]);
			if(i!=detailImage.length-1){
				dp=dp+pict+",";
			}else{
				dp=dp+pict;
			}
		}
		for(int i=0;i<remarkImage.length;i++){
			String pict=fileUpload.uploadFile(remarkImage[i]);
			if(i!=remarkImage.length-1){
				rp=rp+pict+",";
			}else{
				rp=rp+pict;
			}
		}
		model.setDetailPic(dp);
		model.setRemarkPic(rp);
		productService.save(model);
	}
	
//	public void saveImage(){
//		String pic=fileUpload.uploadFile(fileImage);
//		model.setPicture(pic);
//		String picS1=fileUpload.uploadFile(fileImageS1);
//		model.setDetailSPic1(picS1);
//		String picL1=fileUpload.uploadFile(fileImageL1);
//		model.setDetailLPic1(picL1);
//		String picS2=fileUpload.uploadFile(fileImageS2);
//		model.setDetailSPic2(picS2);
//		String picL2=fileUpload.uploadFile(fileImageL2);
//		model.setDetailLPic2(picL2);
//		String picS3=fileUpload.uploadFile(fileImageS3);
//		model.setDetailSPic3(picS3);
//		String picL3=fileUpload.uploadFile(fileImageL3);
//		model.setDetailLPic3(picL3);
//		String picS4=fileUpload.uploadFile(fileImageS4);
//		model.setDetailSPic4(picS4);
//		String picL4=fileUpload.uploadFile(fileImageL4);
//		model.setDetailLPic4(picL4);
//		productService.update(model);
//	}
	
	public void update(){
		Product product=productService.get(model.getId());
		if(model.getPicture()==null){
			model.setPicture(product.getPicture());
		}
		productService.update(model);
	}
	
	public String queryByAllCategory(){
		//System.out.println("进去");
		//System.out.println(categoryName);
		int cid=categoryService.queryIdByType(categoryName);
		List<Product> productList=productService.queryAllByCid(cid);
		application.put("cProduct", productList);
		application.put("categoryName", categoryName);
		return "cproduct";
	}
	
	public String queryBySearch(){
		List<Product> productBySearch=new ArrayList<Product>(); 
		productBySearch=productService.queryBySearch(model.getName());
		application.put("search", model.getName());
		application.put("productBySearch", productBySearch);
		
		return "search";
	}
	
	public String queryByScrollLine(){
		List<Product> productByScrollLine=new ArrayList<Product>();
		List<Category> categories=categoryService.query();
		for(Category category:categories){
			List<Product> products=productService.queryByScrollLine(line, category.getId());
			productByScrollLine.addAll(products);
			System.out.println("line----:"+line);
		}
		jsonList=productByScrollLine;
		return "jsonList";
	}
	
	public String get(){
		Product product=productService.get(model.getId());
		String detailPic=product.getDetailPic();
		String[] detailP=detailPic.split(",");
		String remarkPic=product.getRemarkPic();
		String[] remarkP=remarkPic.split(",");
		request.put("product", product);
		request.put("detailP", detailP);
		request.put("remarkP", remarkP);
		return "detail";
	}
}
