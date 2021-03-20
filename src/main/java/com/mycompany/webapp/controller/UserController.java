package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.UserTemp;

@Controller
@RequestMapping("/user")
public class UserController {
	
	
	@GetMapping("/signup")
	public String signUp() {
		return "auth/sign_up";
	}
	
//	//sign_up form테스트
//	@PostMapping("/signuptest")
//	public String signupTest(UserTemp usertemp) {
//		return "auth/sign_up_test";
//	}
	
}
