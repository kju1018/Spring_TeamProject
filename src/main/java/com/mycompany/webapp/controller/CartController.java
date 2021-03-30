package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartsService cartsService;
	
	@GetMapping("/create_cart")
	public String createCart(Cart cart) {
		cart.setUserid("user1");
		cartsService.createCart(cart);
		return "redirect:/product/product_view_user";//다시 프로덕트 상세
	}
	
	@GetMapping("/cartlist")
	public String getCartList(Model model) {
		List<Cart> list = cartsService.getCartList("user1");
		model.addAttribute("cartList", list);
		
		return "cart/cart";
	}
	
	//선택된 것 삭제(아직 미구현)
	@GetMapping("/delete_cart_selected")
	public String deleteCart(List<Cart> cartList) {
		cartsService.removeCartSelect(cartList);
		
		return "redirect:cartlist";

	}
	
	//전체 삭제
	@GetMapping("/delete_allcart")
	public String deleteCartAll() {
		cartsService.removeCartAll("user1");
		
		return "redirect:cartlist";

	}
	
	//한개만 삭제
	@GetMapping("/delete_cartone")
	public String deleteCartOne(int productno) {
		Cart cart = new Cart();
		cart.setUserid("user1");
		cart.setProductno(productno);
		cartsService.removeCartOne(cart);
		
		return "redirect:cartlist";
	}
	
	//개수 변경
	@GetMapping("/update_quantity")
	public String updateQuantity(Cart cart) {
		cart.setUserid("user1");
		cartsService.updateCart(cart);
		
		return "redirect:cartlist";
	}
	
}
