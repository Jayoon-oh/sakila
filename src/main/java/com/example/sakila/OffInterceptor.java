package com.example.sakila;

import java.awt.desktop.PreferencesHandler;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component // 빈에 등록.
public class OffInterceptor implements HandlerInterceptor{
	 @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      
	  // 요청 URL 을 로그로 기록
      log.debug(request.getRequestURL().toString() + "요청 가로챔");
     // 현재 요청의 세션을 가져옴
      HttpSession session = request.getSession();
  	// 로그인을 했다면 session.getAttribute("loginStaff") 
      if(session.getAttribute("loginStaff") != null) {
    	  //세션에 loginStaff 속성이 존재하면 (즉, 사용자가 로그인한 경우)-> /on/main으로 리다이렉트
         response.sendRedirect(request.getContextPath() + "/on/main");
         return false;
      }
      // preHandle : 컨트롤러가 호출되기 전에 실행.
      return HandlerInterceptor.super.preHandle(request, response, handler);

   }
}

// 사용자가 로그인한 상태에서 특정 URL 접근하면, 다른 페이지로 리다이렉트.
// 로그인하지 않은 경우에는 요청을 정상적으로 처리 가능.