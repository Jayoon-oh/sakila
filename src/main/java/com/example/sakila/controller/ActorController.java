package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.ActorService;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ActorController {
	@Autowired ActorService actorService;
	
	
	@GetMapping("/on/actorList")
	public String actorList(Model model
							, @RequestParam(defaultValue = "1") int currentPage
							, @RequestParam(defaultValue = "10") int rowPerPage
							, @RequestParam(required = false) String searchWord) {
		log.debug("searchWord: "+ searchWord);
		
		// 전체 데이터 수 계산
		int totalCount = actorService.getTotalCount(searchWord);
		
		// 마지막 페이지 계산
		int lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage > 0) {
			lastPage++; // 나머지 있으면 페이지 수 하나 더 추가.
		}
		// int lastPage = actorService.getTotalCount(rowPerPage, searchWord);
		List<Actor> actorList = actorService.getActorList(currentPage, rowPerPage, searchWord);
		model.addAttribute("actorList", actorList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		return "on/actorList";
	}
	
	@PostMapping("/on/addActor")
	public String addActor(HttpSession session, ActorForm actorForm) { // input type="file"
		String path = session.getServletContext().getRealPath("/upload/");
		log.debug(path);
		
		actorService.addActor(actorForm, path);
		
		return "redirect:/on/actorList";
	}	
	
	@GetMapping("/on/addActor")
	public String addActor() {
		return "on/addActor";
	}
	

}