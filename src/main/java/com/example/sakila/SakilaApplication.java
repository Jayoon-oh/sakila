package com.example.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class SakilaApplication implements WebMvcConfigurer {
	@Autowired private OnInterceptor onInterceptor;
	@Autowired private OffInterceptor offInterceptor;
	
	
	public static void main(String[] args) {
		SpringApplication.run(SakilaApplication.class, args);
	}

	// 인터셉터 설정( 1)인터셉터 클래스 구현 2)인터셉트 맵핑
	@Override
	public void addInterceptors(InterceptorRegistry registry) { // 리스트.
		
		//InterceptorRegistry registry : 인터셉트 리스트(앱핑가능)
		// /on/* 으로 시작되는 컨트롤러 가로채어 Oninterceptor.preHandle(request.response) 
		registry.addInterceptor(onInterceptor).addPathPatterns("/on/**"); // 스프링답게 하고 싶으면, new 대신 Autowires 하면 됨.
		registry.addInterceptor(offInterceptor).addPathPatterns("/off/**");
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
}

