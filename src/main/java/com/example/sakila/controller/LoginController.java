package com.example.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.service.StaffService;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j	// 롬복 어노테이션. 로그 기록하기 위해 log 변수 자동생성.
@Controller
public class LoginController {
	@Autowired StaffService staffService;
	
	// 로그아웃 매핑
	@GetMapping("/on/logout")
	public String louout(HttpSession session) {
		session.invalidate(); // 세션 무효화 (로그아웃)
		log.debug("로그아웃 성공"); //@Slf4j 주입받아서 log 라는 annotation 덕분에, 현재시간 설정파일 알아서 찍힘.
		return "redirect:/off/login"; // redirect 있으면, 새로운 컨트롤러 호출.
	}	// login 페이지로 리다이렉트
	
	// 로그인 폼
	@GetMapping("/off/login")
	public String login() {
		log.debug("/off/login 실행됨.");
		return "/off/login"; // 없으면, 그냥 jsp 파일 열기. forward랑 똑같음.
	}
	
	// 로그인 액션
	@PostMapping("/off/login")
	public String login(Model model, HttpSession session,
			@RequestParam(name = "staffId") int staffId // 요청 파라미터로 staffId 로 받기.
			, @RequestParam(name = "password") String password) {
			// int staffId = Interger.parseInt(request.getParameter("staffId"))
			// String password = request.getParameter("password")
			
			Staff paramStaff = new Staff(); 
			paramStaff.setStaffId(staffId); // 파라미터를 객체에 넣음. <키.몸무게>
			paramStaff.setPassword(password); 
			
			Staff loginStaff = staffService.login(paramStaff); //폼에서. <건강진단서>
			if(loginStaff == null) {
				log.debug("로그인 실패");
				model.addAttribute("msg", "로그인실패");
				return "/off/login"; // 만약에 쿼리문에서 없으면 NULL값 반환.
			}
			session.setAttribute("loginStaff", loginStaff);
			log.debug("로그인 성공, 세션loginStaff속성 추가");
		return "redirect:/on/main"; // 값이 있으면 세션에 ID값 넣기!
		
	}

}
