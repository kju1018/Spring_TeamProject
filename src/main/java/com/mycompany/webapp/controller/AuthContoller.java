package com.mycompany.webapp.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

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
	
	@PostMapping(value="/updatepw",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String updatepw(HttpSession session, String upassword) {
		
		String userid = "";
		String status = "";
		if(session.getAttribute("findUserid") != null) {
			logger.info(session.getAttribute("findUserid").toString());
			 userid = session.getAttribute("findUserid").toString();
			 status = "findUserid";
		}
		
		if(session.getAttribute("loginUid") != null) {
			logger.info(session.getAttribute("loginUid").toString());
			 userid = session.getAttribute("loginUid").toString();
			 status = "loginUid";
		}
		
		
		int result = usersService.updateuser(userid, upassword);
		JSONObject jsonObject = new JSONObject();
		
		logger.info(status);
		if(result == 1) {
			logger.info("success" + userid);
			jsonObject.put("updateresult", status.toString());
			return jsonObject.toString();
		}else {
			jsonObject.put("updateresult", "updatefail");
			session.removeAttribute("findUserid");
			return jsonObject.toString();
		}
	}
	
	@PostMapping(value="/findIdProcess", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String findIdProcess(String uemail, String uname) {
		logger.info("실행");
		logger.info(uemail);
		logger.info(uname);
		JSONObject jsonObject = new JSONObject();
		String result = usersService.finduser(uemail, uname);
		jsonObject.put("result", result.toString());
		logger.info(result);
		return jsonObject.toString();
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
		String result = usersService.duplicateId(user);
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
	public String findpw(HttpSession session) {
		if(session.getAttribute("findUserid") != null) {
			session.removeAttribute("findUserid");
		}
		
		return "auth/findpw";
	}
	
	@GetMapping("/pwupdate")
	public String pwupdate(HttpSession session) {
		if(session.getAttribute("findUserid") != null || session.getAttribute("loginUid")!=null) {
			return "auth/pwupdate";
		}else if(session.getAttribute("findUserid") == null) {
			return "redirect:/auth/find_pw";
		}else {
			return "redirect:/mypage/mypage";
		}
		
	}
	
	
	@PostMapping(value="/findpwProcess", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String findpwProcess(String uemail, String uname, String userid, HttpSession session) {
		JSONObject jsonObject = new JSONObject();
		String result = usersService.finduser(uemail, uname, userid);
		if(result.equals("success")) {
			session.setAttribute("findUserid", userid);
			jsonObject.put("result", "notnull");
			return jsonObject.toString();
		}else {
			jsonObject.put("result", "null");
			return jsonObject.toString();
		}
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
		String idresult = usersService.duplicateId(user.getUserid());
		String emailresult = usersService.duplicateEmail(user.getUemail());
	
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		if(idresult.equals("success") && emailresult.equals("success")) {
			usersService.join(user);
			jsonObject.put("result", "success");
						
		}else if(idresult.equals("wrongUid")){
			jsonObject.put("result", "wrongUid");
			
		}else if(emailresult.equals("existemail")){
			jsonObject.put("result", "existemail");
		}else {
			jsonObject.put("result", "fail");
		}
		return jsonObject.toString();
	}
	
	@GetMapping(value="/deleteuser", produces="application/json;charset=UTF-8")
	public String deleteuser(HttpSession session) {
		String userid = session.getAttribute("loginUid").toString();
		String result = usersService.deleteuser(userid);
		if(result.equals("success")) {
			session.removeAttribute("loginUid");
			return "redirect:/";
		}else {
			return  "redirect:/mypage/mypage";
		}
	}
	

	

}