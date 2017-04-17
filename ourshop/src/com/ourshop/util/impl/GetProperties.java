package com.ourshop.util.impl;

import java.io.InputStream;
import java.util.Properties;

public class GetProperties {
	
	public static void getPropertied(String propertiesName,Properties properties){
	InputStream inputStream=GetProperties.class
			.getClassLoader().getResourceAsStream(propertiesName);
	System.out.println(propertiesName);
	try {
		System.out.println("----1");
		properties.load(inputStream);
		System.out.println("-----2");
	} catch (Exception e) {
		throw new RuntimeException();
	}
	}
}
