package com.example.sakila.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorFileService;
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;

@Controller
public class ActorFileController {
	@Autowired ActorFileService actorFileService;

	@GetMapping("/on/removeActorFile")
	public String removeActorFile(HttpSession session
								, @RequestParam int actorFileId
								, @RequestParam int actorId) {
		String path = session.getServletContext().getRealPath("/upload/");
		actorFileService.removeActorFile(actorFileId, path);
		return "redirect:/on/actorOne?actorId="+actorId;
	}
	
	@PostMapping("/on/addActorFile")
	public String addActorFile(HttpSession session
								, Model model
								, ActorForm actorForm) {
		List<MultipartFile> list = actorForm.getActorFile();
		for(MultipartFile f : list) { // 이미지파일은 *.jpg or *.png 가능
			if(f.getContentType().equals("image/jpeg") == false
					&& f.getContentType().equals("image/png") == false) {
				model.addAttribute("msg", "이미지 파일만 입력이 가능합니다");
				return "on/addActorFile";
			}
		}

		String path = session.getServletContext().getRealPath("/upload/");
		System.out.println(path + "<---path");
		
		// 디렉토리 존재 여부 확인 및 생성.
		 File uploadDir = new File(path);
		    if (!uploadDir.exists()) {
		        uploadDir.mkdirs(); // 디렉토리가 없으면 생성
		    }

		actorFileService.addActorFile(actorForm, path);
		return "redirect:/on/actorOne?actorId="+actorForm.getActorId();
	}


	@GetMapping("/on/addActorFile")
	public String addActorFile(Model model, @RequestParam int actorId) {
		model.addAttribute("actorId", actorId);
		return "on/addActorFile";
	}


}