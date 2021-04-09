package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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
	
	//카트 생성
	@GetMapping(value="/create_cart", produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String createCart(Cart cart, Authentication auth) {
		JSONObject jsonObject = new JSONObject();
		
		cart.setUserid(auth.getName());//제품상세에서 받은 productno, quantity를 이용해서 Cart객체 생성
		Cart tempCart = cartsService.getCart(cart);//위에서 만든 카트와 동일한 카트가 없으면 null

		if(tempCart == null) {
			cartsService.createCart(cart);
			jsonObject.put("result", "success");
		} else {
			jsonObject.put("result", "failure");
		}
		
		return jsonObject.toString();
	}
	
	//카트 페이지
	@GetMapping("/cart")
	public String getCart() {
		
		return "cart/cart";
	}
	
	//카트 목록 출력
	@GetMapping("/cartlist")
	public String getCartList(Model model, Authentication auth) {
		List<Cart> list = cartsService.getCartList(auth.getName());
		model.addAttribute("cartList", list);
		return "cart/cartlist";
	}
	
	//선택된 카트 삭제
	@GetMapping(value="/delete_cart_selected", produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String deleteCart(@RequestParam(value="cartArr[]") List<String> cartArr, Authentication auth) {
		JSONObject jsonObject = new JSONObject();
		
		List<Cart> cartlist = new ArrayList<Cart>();
		
		for(String productno : cartArr) {
			Cart cart = new Cart();
			cart.setUserid(auth.getName());
			cart.setProductno(Integer.parseInt(productno));
			cartlist.add(cart);
		}
		
		if(cartlist.size() > 0) {
			cartsService.removeSelectCart(cartlist);
			jsonObject.put("result", "success");
		}
		return jsonObject.toString();
	}
	
	//전체 삭제
	@GetMapping(value="/delete_allcart", produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String deleteCartAll(Authentication auth) {
		
		cartsService.removeCartAll(auth.getName());
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		return jsonObject.toString();
	}

	//개수 변경
	@GetMapping(value="/update_quantity", produces="application/json;charset=UTF-8" )
	@ResponseBody
	public String updateQuantity(Cart cart, Authentication auth) {
		cart.setUserid(auth.getName());
		JSONObject jsonObject = new JSONObject();
		
		if(cart.getCartquantity() < 1) {
			jsonObject.put("result", "failure");
			return jsonObject.toString();
		}else {
			cartsService.updateCartQuantity(cart);
			
			jsonObject.put("result", "success");
			return jsonObject.toString();
		}
		
	}
	
}
