package com.mycompany.webapp.controller;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private static final Logger logger =
			LoggerFactory.getLogger(AuthContoller.class);
	
	@Autowired
	UsersService usersService;
	// 아이디 찾기 폼으로 이동
	@GetMapping("/find_id")
	public String findid() {
		
		return "auth/findid";
	}
	
	//로그인 폼으로 이동
	@GetMapping("/login")
	public String login() {	
		return "auth/login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		//session.invalidate();
		session.removeAttribute("loginUid");
		return "redirect:/";
	}
	
	//로그인 과정 처리
	@PostMapping("/loginprocess")
	public String loginprocess(User user, HttpSession session) {
		String result = usersService.loginProcess(user);
		logger.info(result);
		if(result.equals("success")) {
			session.removeAttribute("loginerror");
			session.setAttribute("loginUid", user.getUserid());
			return "redirect:/";			
		}else {
			session.setAttribute("loginerror", result);
			return "redirect:/auth/login";
		}
	}
	// 비밀번호 찾기 폼으로 이동
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