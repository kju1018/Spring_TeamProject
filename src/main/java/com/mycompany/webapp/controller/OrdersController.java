package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycompany.webapp.dto.Cart;
import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.OrderProduct;
import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.CartsService;
import com.mycompany.webapp.service.OrderProductsService;
import com.mycompany.webapp.service.OrdersService;
import com.mycompany.webapp.service.ProductsService;
import com.mycompany.webapp.service.UsersService;

@Controller
public class OrdersController {

	private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);

	@Autowired
	private OrdersService ordersService;

	@Autowired
	private ProductsService productsService;
	
	@Autowired
	private OrderProductsService orderProductsService;
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private CartsService cartsService;

	// 주문서를 가져오는 부분
	@PostMapping("/order/order_form")
	public String createOrderForm(
			int[] chk_productno, 
			String quantity,
			int isCart,
			Model model, 
			Authentication auth) {
		
		List<Products> productList = new ArrayList<Products>();
		String[] quantityArr = quantity.split(" ");
		
		for(int i = 0; i < chk_productno.length; i++) {
			Products product = productsService.pSelectByPno(chk_productno[i]);
			productList.add(product);
		}
		User user = usersService.finduser(auth.getName());
		model.addAttribute("user", user);
		model.addAttribute("list", productList);
		model.addAttribute("quantityArr",quantityArr);
		model.addAttribute("isCart", isCart);
		return "order/orderForm";
	}
	
	//주문 처리
	@PostMapping("/order/create_order")
	public String createOrder(
			int[] order_productno, 
			int[] order_quantity,
			int isCart,
			Order order, 
			Authentication auth
			) {

		// 오더 생성
		order.setUserid(auth.getName());
		order.setOstatus("입금 대기중");
		ordersService.createOrder(order);
		
	
		if(isCart == 1) {//카트에서 구매 할 때
			List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
			List<Cart> cartList = new ArrayList<Cart>();
			for(int i = 0; i < order_productno.length; i++) {
				//주문 물품을 만들어준다
				OrderProduct orderProduct = new OrderProduct();
				orderProduct.setProductno(order_productno[i]);
				orderProduct.setOquantity(order_quantity[i]);
				orderProduct.setOrderno(order.getOrderno());
				orderProductList.add(orderProduct);
				
				//카트에서 구매를 했기 때문에 삭제도 해줘야함
				Cart cart = new Cart();
				cart.setUserid(auth.getName());
				cart.setProductno(order_productno[i]);
				cartList.add(cart);
			}
			orderProductsService.createOrderProductByList(orderProductList);
			cartsService.removeSelectCart(cartList);
			
		} else { // 상품 상세 페이지에서 직접 구매할 때
			OrderProduct orderProduct = new OrderProduct();
			orderProduct.setProductno(order_productno[0]);
			orderProduct.setOquantity(order_quantity[0]);
			orderProduct.setOrderno(order.getOrderno());
		
			orderProductsService.createOrderProduct(orderProduct);
		}
		
		return "redirect:/order/order_complete";
	}

	@GetMapping("/order/order_complete")
	public String orderComplete(Model model) {

		return "order/payment_c";
	}
	
	@GetMapping("/mypage/ordered_list")
	public String getOrderedList(Model model, Authentication auth) {
		
		List<Order> orderList = ordersService.getOrderList(auth.getName());
		model.addAttribute("orderList", orderList);
		
		return "mypage/ordered_list";
	}
	
	@GetMapping("/mypage/order_cancel")
	public String orderCancel(int orderno) {
		
		Order order = new Order();
		order.setOstatus("취소");
		order.setOrderno(orderno);
		ordersService.updateOrder(order);
		
		return "redirect:/mypage/ordered_list";
	}
	
	@GetMapping("/mypage/order_view")
	public String orderView(int orderno,Model model) {
		Order order = ordersService.getOrder(orderno);
		model.addAttribute("order", order);
		return "mypage/ordered_view";
	}

}
