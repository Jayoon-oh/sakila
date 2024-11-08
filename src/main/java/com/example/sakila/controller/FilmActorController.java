package com.example.sakila.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FilmActorController {
	@PostMapping("/on/addFilmByActor")
	public String addFilmByActor(@RequestParam int filmId, 
								 @RequestParam int actorId) {
		log.debug("filmId : " + filmId);
		log.debug("actorId : " + actorId);
		
		
		
		return "redirect:/on/actorOne?actorId="+actorId;
	}
	
}

