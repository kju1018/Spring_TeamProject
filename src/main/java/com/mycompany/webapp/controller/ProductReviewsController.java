package com.mycompany.webapp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.ProductReviews;
import com.mycompany.webapp.service.ProductReviewsService;

@Controller
@RequestMapping("/product")
public class ProductReviewsController {
	private static final Logger logger = LoggerFactory.getLogger(ProductReviewsController.class);
	
	@Autowired
	private ProductReviewsService productReviewsService;
	
	@RequestMapping("/review_view")
	public String test(Model model) {		
		  List<ProductReviews> list = productReviewsService.prSelectAll(); //
		  ProductReviews test = new ProductReviews(); // test = list.get(0); //
		  logger.info(test.getBcontent());
		  logger.info("test");
		model.addAttribute("list", list);
		return "product/review_view";
	} 
}
