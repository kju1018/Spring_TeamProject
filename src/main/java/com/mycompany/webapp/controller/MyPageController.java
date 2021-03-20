package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@GetMapping("/mypage_update")
	public String myPageUpdate() {
		return "mypage/mypage_update";
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
	public String PostList() {
		return "mypage/post_list";
	}
}