package com.mycompany.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {
	
	@GetMapping("/payment")
	public String payment() {
		return "payment/payment";
	}
	//TODO: payment에서 양식을 다 작성하고 확인을 누르면 post로 전송(결재완료)
	
	
	
	
	@GetMapping("/payment_result")
	public String paymentResult() {
		return "payment/payment_c";
	}
}