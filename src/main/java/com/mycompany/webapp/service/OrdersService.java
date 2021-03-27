package com.mycompany.webapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrdersDao;
import com.mycompany.webapp.dto.Order;

@Service
public class OrdersService {
	
	@Autowired
	private OrdersDao ordersDao;
	
	public void saveOrder(Order order) {
		ordersDao.insert(order);
	}
}
