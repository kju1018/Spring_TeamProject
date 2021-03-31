package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Cart;
import com.mycompany.webapp.service.CartsService;

@Controller
@RequestMapping("/cart")
public class CartController {

	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartsService cartsService;
	
	@GetMapping(value="/create_cart", produces="application/json;charset=UTF-8" )
	public String createCart(Cart cart) {
		cart.setUserid("user1");
		Cart tempCart = cartsService.getCart(cart);
		
		JSONObject jsonObject = new JSONObject();
		if(tempCart == null) {
			cartsService.createCart(cart);
			jsonObject.put("result", "success");
		} else {
			jsonObject.put("result", "fail");
		}
		
		return jsonObject.toString();
	}
	
	@GetMapping("/cart")
	public String getCart() {
		
		return "cart/cart";
	}
	
	@GetMapping("/cartlist")
	public String getCartList(Model model) {
		List<Cart> list = cartsService.getCartList("user1");
		model.addAttribute("cartList", list);
		return "cart/cartlist";
	}
	
	@GetMapping(value="/delete_cart_selected", produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String deleteCart(@RequestParam(value="cartArr[]") List<String> cartArr) {
		JSONObject jsonObject = new JSONObject();
		List<Cart> cartlist = new ArrayList<Cart>();
		for(String productno : cartArr) {
			Cart cart = new Cart();
			cart.setUserid("user1");
			cart.setProductno(Integer.parseInt(productno));
			cartlist.add(cart);
		}
		if(cartlist.size() > 0) {
			cartsService.removeCartSelect(cartlist);
			jsonObject.put("result", "success");
		}
		return jsonObject.toString();
	}
	
	//전체 삭제
	
	@GetMapping(value="/delete_allcart", produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String deleteCartAll() {
		cartsService.removeCartAll("user1");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		return jsonObject.toString();
	}

	//개수 변경
	
	@GetMapping(value="/update_quantity", produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String updateQuantity(Cart cart) {
		cart.setUserid("user1");
		cartsService.updateCart(cart);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		return jsonObject.toString();
	}
	
	/*@PostMapping("/test")
		public String test() {
			logger.info("dsaff");
			logger.info(""+chk_box.length);
			return "redirect:cartlist";
	}*/
}
