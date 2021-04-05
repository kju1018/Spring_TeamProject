package com.mycompany.webapp.controller;

import java.util.List;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.ProductReviews;
import com.mycompany.webapp.service.ProductReviewsService;

@Controller
@RequestMapping("/product")
public class ProductReviewsController {
	private static final Logger logger = LoggerFactory.getLogger(ProductReviewsController.class);
	
	@Autowired
	private ProductReviewsService productReviewsService;
	

	
	@RequestMapping("/product_review_list") 
	public String product_review_list() {
		return "product/product_review_list"; 
	}
	
	
	@RequestMapping(value="/rvboard", produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String rvboard(Model model) {		
		List<ProductReviews> rv_list = productReviewsService.prSelectByPno(1);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("rv_list", rv_list);	
		return jsonObject.toString();
	}
	
	 
	/*
	@RequestMapping("/reviewList")
	public String reviewList(int productno, Model model) {
		List<ProductReviews> rv_list = productReviewsService.prSelectByPno(productno);
		logger.info("rv_list값 : "+rv_list.get(0).getBcontent());
		model.addAttribute("rv_list", rv_list);
		return "product/reviewList";
	} 
*/
	
}
