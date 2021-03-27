package com.mycompany.webapp.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.UsersService;

@Controller
@RequestMapping("/auth")
public class AuthContoller {
	
	@Autowired
	UsersService usersService;

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
	// signup -> 회원가입 양식으로 이동
	@GetMapping("/signup")
	public String signUp() {
		return "auth/sign_up";
	}
	// signup proccess 과정 (회원가입 양식에서 넘어온 데이터를 데이터베이스에 넣는 과정)
	@PostMapping(value="/signupprocess", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String signupprocess(User user) {
		//회원가입 처리
//		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
//		user.setUpassword(bpe.encode(user.getUpassword()));
		String result = usersService.duplicateId(user);
		JSONObject jsonObject = new JSONObject();
		if(result.equals("success")) {
			usersService.join(user);
			jsonObject.put("result", "success");
		}else if(result.equals("wrongUid")) {
			jsonObject.put("result", "wrongUid");
		}
		
		
		
		return jsonObject.toString();
	}
	

	

}