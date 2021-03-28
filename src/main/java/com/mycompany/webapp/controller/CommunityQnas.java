package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.service.CommunityQnasService;


@Controller
@RequestMapping("/community")
public class CommunityQnas {
	private static final Logger logger =
			LoggerFactory.getLogger(CommunityQnas.class);
	
	@Autowired
	private CommunityQnasService communityQnasService; 
	
	@GetMapping("/answer_view")
	public String answerView() {
		return "community/answer_view";
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
