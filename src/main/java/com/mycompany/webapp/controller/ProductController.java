package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
	@GetMapping("/p_qna_view")
	public String p_qna_view() {
		return "product/p_qna_view";
	}
	
	@GetMapping("/p_qna_write")
	public String p_qna_write() {
		return "product/p_qna_write";
	}
	
	@GetMapping("/product_view")
	public String product_view() {
		return "product/product_view";
	}
	
	@GetMapping("/review_view")
	public String review_view() {
		return "product/review_view";
	}
	
	@GetMapping("/review_write")
	public String review_write() {
		return "product/review_write";
	}

}
