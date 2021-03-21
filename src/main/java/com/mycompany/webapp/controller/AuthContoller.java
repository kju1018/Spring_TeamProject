package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthContoller {

	@RequestMapping("/find_id")
	public String findid() {
		
		return "auth/findid";
	}
	@RequestMapping("/login")
	public String login() {	
		return "auth/login";
	}
	
	@GetMapping("/find_pw")
	public String findpw() {
		
		return "auth/findpw";
	}
	
	@GetMapping("/signup")
	public String signUp() {
		return "auth/sign_up";
	}
	
	@PostMapping("/signup")
	public String signUpProcess() {
		//회원가입 처리
		return "redirect:/auth/signup_complete";
	}
	
	@GetMapping("/signup_complete")
	public String signUpComplete() {
		return "auth/signup_c";
	}
}