package com.ourshop.util.impl;

import java.io.File;
import java.io.FilenameFilter;
import java.util.UUID;

import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.ourshop.util.FileUpload;

//实现文件上传逻辑
@Component("fileUpload")
public class FileUploadUtil implements FileUpload{
	@Value("#{prop.basePath+prop.filePath}")
	private String filePath;
	@Value("#{prop.basePath+prop.bankPath}")
	private String bankPath;

	//在服务器启动时初始化
	@Override
	public String[] getBankImage() {
		return new File(bankPath).list(new FilenameFilter() {

			@Override
			public boolean accept(File dir, String name) {
				// 通过后缀名来实现文件过滤效果
//				System.out.println("dir:"+dir+", name:"+name);
				return name.endsWith(".gif");
			}
		});
	}
	
	//1.通过文件名获取扩展名
	private String getFileExt(String fileName){
		System.out.println(fileName);
		return "jpg";
	}
	
	// 2.生成UUID随机数，作为新的文件名
	private String newFileName(String fileName){
		String ext = getFileExt(fileName);
		return UUID.randomUUID().toString() + "." + ext;
	}
	
	// 3.实现文件上传功能，返回上传后新的文件名称
	@Override
	public String uploadFile(File fileImage) {
		// 获取新的文件名
		System.out.println("---文件名---"+fileImage.getName());
		String pic = newFileName(fileImage.getName());
		try {
			FileUtil.copyFile(fileImage, new File(filePath, pic));
			return pic;
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			fileImage.delete();
		}
	}

}
