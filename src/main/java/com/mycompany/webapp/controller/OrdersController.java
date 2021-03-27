package com.mycompany.webapp.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.service.OrdersService;

@Controller
@RequestMapping("/order")
public class OrdersController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);
	
	@Autowired
	private OrdersService ordersService;
	
	@GetMapping("/order_form")
	public String createOrderForm() {
		//pno 필요할듯
		return "order/orderForm";
	}
	
//	public String createForm(Order order, HttpSession session) {
	@PostMapping("create_order")
	public String createForm(Order order) {
		//결재가 다 완료된다면(나중에 생각)
		//아마 여기서 orderproducts도 만들어야할듯
//		String uid = (String) session.getAttribute("loginUid");
//		if (uid == null) {
//			order.setUid(uid);
			order.setoState("입금 대기중");
			order.setoNumber(order.getoNumber().replace(",", "-"));
//		} else {
//			//주문 취소
//		}
//		ordersService.saveOrder(order);
		
		logger.info(order.toString());
		return "redirect:/order/order_form";
	}
}
