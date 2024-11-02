package com.example.sakila.controller;

import java.util.Map;

import org.apache.tomcat.util.security.MD5Encoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StaffController {
	@Autowired StaffMapper staffMapper;
	@GetMapping("/on/staffOne") //데이터베이스에서 받아서, Return으로 jsp파일 열기.
	public String staffOne(HttpSession session, Model model) {
		int staffId = ((Staff)(session.getAttribute("loginStaff"))).getStaffId();
		Map<String, Object> staff = staffMapper.selectStaffOne(staffId);
		model.addAttribute("staff",staff);
		log.debug(staff.toString());
		return "on/staffOne";
	}
	
}

//데이터베이스 (mapper) 조회 및 , 컨트롤러 수행 역할 후 jsp 파일 열기.