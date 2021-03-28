package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//주문서를 가져오는 부분
	@GetMapping("/order_form")
	public String createOrderForm() {
		//pno 필요할듯
		return "order/orderForm";
	}
	
	//주문서에서 form을 다 작성하고 결제 완료버튼을 누르면 처리하는곳 (Order 생성)
//	public String createForm(Order order, HttpSession session) {
	@PostMapping("/create_order")
	public String createOrder(Order order) {
		//결재가 다 완료된다면(나중에 생각)
		//아마 여기서 orderproducts도 만들어야할듯
//		String uid = (String) session.getAttribute("loginUid");
		String userId = "user1";
		if (userId != null) {
			order.setOrderno(1);//일단 임의로 지정
			order.setUserid(userId);//일단 임의로 지정
			order.setOstatus("입금 대기중");
			order.setOnumber(order.getOnumber().replace(",", "-"));
		} else {
			//주문 취소 등
		}
		ordersService.createOrder(order);
		logger.info(order.toString());
		
		return "redirect:/order/order_complete";
	}
	
	@GetMapping("/order_complete")
	public String orderComplete(Model model) {
		//1. orderNo을 통해 select로 방금 주문한 Order를 완료창에서 보여줌(session이용?)
		int orderNo = 1;//가져오는방법 생각해보기
		Order order = ordersService.getOrder(orderNo);//방금 주문한(생성한) Order
		model.addAttribute("order", order);
		//2. createOrder에서 만든 Order를 여기로 보내줌 (물어보기)
		
		return "order/payment_c";
	}
	
}
