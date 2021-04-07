package com.mycompany.webapp.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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
	
	
	
	@PostMapping(value="/findIdProcess", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String findIdProcess(String uemail, String uname) {
	
		JSONObject jsonObject = new JSONObject();
		String result = usersService.finduser(uemail, uname);
		jsonObject.put("result", result.toString());
	
		return jsonObject.toString();
	}
	
	//로그인 폼으로 이동
	@GetMapping("/login")
	public String login(Authentication auth) {
	
			return "auth/login";
	
	}
	

	// 비밀번호 찾기 폼으로 이동
	@GetMapping("/find_pw")
	public String findpw(HttpSession session) {
		if(session.getAttribute("findUserid") != null) {
			session.removeAttribute("findUserid");
		}
		
		return "auth/findpw";
	}
	
	//findpw -> pwudpate 넘어갈떄
	@GetMapping("/pwupdate")
	public String pwupdate(HttpSession session ) {
		if(session.getAttribute("findUserid")!=null) {
			return "auth/pwupdate";
		}{
			return "redirect:/auth/find_pw";
		}
	}
	// 로그인 유저가 들어가는 updatepw form 이동
	@GetMapping("/upwupdate")
	public String upwupdate() {

			return "auth/pwupdate";
	}
	

	/// 비밀번호 업데이트 (로그인 유저 or 비밀번호 찾기를 통해 들어온 회원)
	@PostMapping(value="/updatepw",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String updatepw(HttpSession session, String upassword, Authentication auth) {
		
		String userid = "";
		String status = "";
		
		
		try {
			 userid = auth.getName();
			 status = "loginUid";
			
		}catch (Exception e) {
			if(session.getAttribute("findUserid") != null) {
				
				 userid = session.getAttribute("findUserid").toString();
				 status = "findUserid";
			}
		}
		
		
		
		
		int result = usersService.updateuser(userid, upassword);
		JSONObject jsonObject = new JSONObject();
		logger.info(userid);
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
	
	@PostMapping(value="/deleteuser", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String deleteuser(Authentication auth) {
		String userid = auth.getName();
		logger.info(userid);
		String result = usersService.deleteuser(userid);
		JSONObject jsonObject = new JSONObject();
		if(result.equals("success")) {
			jsonObject.put("result", "success");
			return jsonObject.toString();
		}else {
			jsonObject.put("result", "fail");
			return jsonObject.toString();
		}
	}
	

	

}