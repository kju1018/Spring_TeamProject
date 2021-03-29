package com.mycompany.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Cart;
import com.mycompany.webapp.service.CartsService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartsService cartsService;
	
	@GetMapping("/create_cart")
	public String createCart(Cart cart) {
		cart.setUserid("user1");
		cartsService.createCart(cart);
		
		return "redirect:";//다시 프로덕트 상세
	}
	
	@GetMapping("/cartlist")
	public String getCartList(Model model) {
		List<Cart> list = cartsService.getCartList("user1");
		model.addAttribute("cartList", list);
		
		return "mypage/cart";
	}
	
	@DeleteMapping("/delete_cart")
	public String deleteCart(List<Cart> cartList) {
		
		return "redirect:mypage/cart";
	}
	
}
