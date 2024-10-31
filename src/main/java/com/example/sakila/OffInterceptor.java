package com.example.sakila;

import java.awt.desktop.PreferencesHandler;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class OffInterceptor implements HandlerInterceptor{
	 @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      // 로그인이 되어 있다면
      log.debug(request.getRequestURL().toString() + "요청 가로챔");
      // 로그인을 하지 않았다면 session.setAttribute("loginStaff")
      HttpSession session = request.getSession();
      if(session.getAttribute("loginStaff") != null) {
         response.sendRedirect(request.getContextPath() + "/on/main");
         return false;
      }
      return HandlerInterceptor.super.preHandle(request, response, handler);

   }
}

