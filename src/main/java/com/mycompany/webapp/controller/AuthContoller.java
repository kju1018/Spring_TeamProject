package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
public class AuthContoller {

	@RequestMapping("/findid")
	public String findid() {
		
		return "auth/findid";
	}
	@RequestMapping("/login")
	public String login() {	
		return "auth/login";
	}
	

	
	@GetMapping("/findpw")
	public String findpw() {
		
		return "auth/findpw";
	}
	
}