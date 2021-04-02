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
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.OrderProduct;
import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.OrderProductsService;
import com.mycompany.webapp.service.OrdersService;
import com.mycompany.webapp.service.ProductsService;
import com.mycompany.webapp.service.UsersService;

@Controller
@RequestMapping("/order")
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

	// 주문서를 가져오는 부분
	@PostMapping("/order_form")
	public String createOrderForm(int[] chk_productno, String quantity, Model model, Authentication auth) {
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
		
		return "order/orderForm";
	}
	
	@PostMapping("/create_order")
	public String createOrder(int[] order_productno, int[] order_quantity, Order order, Authentication auth) {
		
		order.setUserid(auth.getName());
		order.setOstatus("입금 대기중");
		ordersService.createOrder(order);
		
		List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
		for(int i = 0; i < order_productno.length; i++) {
			OrderProduct orderProduct = new OrderProduct();
			
			orderProduct.setProductno(order_productno[i]);
			orderProduct.setOquantity(order_quantity[i]);
			orderProduct.setOrderno(order.getOrderno());
			
			orderProductList.add(orderProduct);
		}
		//만약 카트 목록에서 주문한것이면 카트리스트도 삭제해주는거 구현
	
		orderProductsService.createOrderProductByList(orderProductList);
		

		return "redirect:/order/order_complete";
	}

	@GetMapping("/order_complete")
	public String orderComplete(Model model) {
		// 1. orderNo을 통해 select로 방금 주문한 Order를 완료창에서 보여줌(session이용?)
		int orderNo = 1;// 가져오는방법 생각해보기
		Order order = ordersService.getOrder(orderNo);// 방금 주문한(생성한) Order
		model.addAttribute("order", order);
		// 2. createOrder에서 만든 Order를 여기로 보내줌 (물어보기)

		return "order/payment_c";
	}
	

}
