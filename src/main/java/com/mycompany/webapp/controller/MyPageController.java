package com.mycompany.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.CommunityQna;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.CommunityQnasService;
import com.mycompany.webapp.service.UsersService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	private static final Logger logger =
			LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	UsersService usersService;
	@Autowired
	CommunityQnasService communityqnasService;
	
	// 마이페이지 수정 폼 이동
	@GetMapping("/mypageupdate")
	public String myPageUpdate(HttpSession session, Model model) {
		if(session.getAttribute("loginUid") != null) {
			User dbuser = usersService.finduser(session.getAttribute("loginUid").toString());
			if(dbuser != null) {
				model.addAttribute("user",dbuser);
				return "mypage/mypage_update";
			}else {
				return  "redirect:/mypage/mypage";
			}
			
		}else {
			return "redirect:/";
		}
		
	}
	
	@PostMapping(value="/updateprocess" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String updateprocess(HttpSession session, User user) {
		//회원정보 수정 처리
		
		String userid = session.getAttribute("loginUid").toString();
		user.setUserid(userid);
		logger.info(user.getUzipcode());
		logger.info(user.getUaddress());
		logger.info(user.getUserid());
		String result = usersService.updateInfo(user);
		
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		return jsonObject.toString();
	}
	
	@GetMapping("/cart")
	public String Cart() {
		return "mypage/cart";
	}
	
	@GetMapping("/like_list")
	public String likeList() {
		return "mypage/like_list";
	}
	
	@GetMapping("/mypage")
	public String Mypage() {
		return "mypage/mypage";
	}
	
	@GetMapping("/ordered_list")
	public String OrderedList() {
		return "mypage/ordered_list";
	}
	
	@GetMapping("/ordered_view")
	public String OrderedView() {
		return "mypage/ordered_view";
	}
	
	@GetMapping("/post_list")
	   public String postList(
	      String pageNo, Model model, HttpSession session, String userid) {
	         int intPageNo = 1;
	         if(pageNo == null) {
	         //세션에서 Pager를 찾고, 있으면 pageNo를 설정
	         Pager pager = (Pager) session.getAttribute("pager");
	            if(pager != null) {
	               intPageNo = pager.getPageNo();
	            }
	         } else {
	            intPageNo = Integer.parseInt(pageNo);
	         }
	         
	         
	         int totalRows = communityqnasService.getTotalRow("user2");
	         Pager pager = new Pager(6, 5, totalRows, intPageNo, "user2");
	         session.setAttribute("pager", pager);
	         List<CommunityQna> list = communityqnasService.getBoardListById(pager);
	         model.addAttribute("list", list); //오른쪽이 위에 list 왼쪽이 jsp에서 쓸 이름
	         model.addAttribute("pager", pager);
	      return "mypage/post_list";
	   }
}