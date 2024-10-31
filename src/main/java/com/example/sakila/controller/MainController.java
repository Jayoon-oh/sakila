package com.example.sakila.controller;

import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;



@Slf4j
@Controller
public class MainController {
	@GetMapping("/on/main")
	public String main() {
		return "on/main";
	}
	
}
