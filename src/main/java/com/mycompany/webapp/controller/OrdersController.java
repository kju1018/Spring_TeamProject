package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Cart;
import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.service.CartsService;
import com.mycompany.webapp.service.OrderProductsService;
import com.mycompany.webapp.service.OrdersService;
import com.mycompany.webapp.service.ProductsService;

@Controller
@RequestMapping("/order")
public class OrdersController {

	private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);

	@Autowired
	private OrdersService ordersService;

	@Autowired
	private ProductsService productsService;

	// 주문서를 가져오는 부분
	@PostMapping("/order_form")
	public String createOrderForm(int[] chk_productno, String quantity, Model model) {
		List<Integer> list = new ArrayList<Integer>();
		String[] quantityArr = quantity.split(" ");
		for(int i = 0; i < chk_productno.length; i++) {
			list.add(chk_productno[i]);
		}
		model.addAttribute("list", list);
		model.addAttribute("quantityArr",quantityArr);
		
		return "order/orderForm";
	}
	
	@PostMapping("/create_order")
	public String createOrder(int[] order_productno, int[] order_quantity, Order order) {
		
		order.setUserid("user1");
		ordersService.createOrder(order);
		
		for(int a: order_productno) {
			logger.info(" "+a);
		}
		
		for(int a: order_quantity) {
			logger.info(" "+a);
		}
		logger.info(order.toString());
		
		/*String userId = "user1";
		if (userId != null) {
			order.setUserid(userId);// 일단 임의로 지정
			order.setOstatus("입금 대기중");
			order.setOnumber(order.getOnumber().replace(",", "-"));
		} else {
			// 주문 취소 등
		}
		ordersService.createOrder(order);
		logger.info(order.toString());*/

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
