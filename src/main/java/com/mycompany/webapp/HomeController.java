package com.mycompany.webapp;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.service.ProductsService;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private ProductsService productsService;
	
	@GetMapping("/")
	public String home(Model model) {
		List<Products> best = productsService.pSelectBest();
		List<Products> newitem = productsService.pSelectDate();
		model.addAttribute("best", best);
		model.addAttribute("newitem", newitem);
		return "home";
	}
	
	
}
