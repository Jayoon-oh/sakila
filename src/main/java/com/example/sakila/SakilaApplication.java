package com.example.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class SakilaApplication implements WebMvcConfigurer {
	// on & off Interceptor 클래스 자동 주입. 
	@Autowired private OnInterceptor onInterceptor;
	@Autowired private OffInterceptor offInterceptor;
	
	// Spring boot 가장 먼저 실행되는 메서드
	public static void main(String[] args) {
		SpringApplication.run(SakilaApplication.class, args);
	}

	// 인터셉터 설정 1)인터셉터 클래스 구현 2)인터셉트 맵핑
	@Override 
	public void addInterceptors(InterceptorRegistry registry) { // 리스트.
		
		//InterceptorRegistry registry : 인터셉트 리스트(앱핑가능)
		// /on/* 으로 시작되는 컨트롤러 가로채어 Oninterceptor.preHandle(request.response) 
		registry.addInterceptor(onInterceptor).addPathPatterns("/on/**"); // 스프링답게 하고 싶으면, new 대신 Autowires 하면 됨.
		registry.addInterceptor(offInterceptor).addPathPatterns("/off/**");
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
}

// 인터셉터를 설정하고 애플리케이션을 실행하는 역할.
