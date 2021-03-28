package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class NoticesController {
	private static final Logger logger =
			LoggerFactory.getLogger(NoticesController.class);
	
	@GetMapping("/notice_list")
	public String noticeList() {
		return "community/notice_list";
	}
	@GetMapping("/notice_view")
	public String notice_view() {
		return "community/notice_view";
	}
	
}
