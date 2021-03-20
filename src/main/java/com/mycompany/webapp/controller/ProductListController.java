package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductListController {
	
	//나중에 PathVariable로 숫자에따라 카테고리 분류
	@GetMapping("/product_list")
	public String productList() {
		return "list/product_list";
	}
}
