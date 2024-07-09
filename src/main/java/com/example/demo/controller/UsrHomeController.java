package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UsrHomeController {
	
	@Value("${custom.apiTest1.key}")
	private String apiTest1Key;
	
	@GetMapping("/usr/home/main")
	public String showMain() {
		return "usr/home/main";
	}
	
	@GetMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
	
	@GetMapping("/usr/home/popUp")
	public String popUp() {
		return "usr/home/popUp";
	}
	
	@GetMapping("/usr/home/apiTest1")
	public String apiTest1(Model model) {
		
		model.addAttribute("apiTest1Key", apiTest1Key);
		
		return "usr/home/apiTest1";
	}
	@GetMapping("/usr/home/apiTest2")
	public String apiTest2() {
		return "usr/home/apiTest2";
	}
}
