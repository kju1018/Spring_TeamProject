package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {
		
		@GetMapping("/answer_view")
		public String answerView() {
			return "community/answer_view";
		}
		
		@GetMapping("/notice_list")
		public String noticeList() {
			return "community/notice_list";
		}
		@GetMapping("/notice_view")
		public String notice_view() {
			return "community/notice_view";
		}
		@GetMapping("/qna_list")
		public String qnaList() {
			return "community/qna_list";
		}
		@GetMapping("/qna_view")
		public String qnaView() {
			return "community/qna_view";
		}
		@GetMapping("/qna_write")
		public String qnaWrite() {
			return "community/qna_write";
		}
		
}