package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrdersDao;
import com.mycompany.webapp.dto.Order;

@Service
public class OrdersService {
	
	@Autowired
	private OrdersDao ordersDao;

	public Order getOrder(int orderNo) {
		Order order = ordersDao.selectByOrderNo(orderNo);
		return order;
	}
	
	public List<Order> getOrderList(String userId){
		List<Order> orderList = ordersDao.selectByUserId(userId);
		return orderList;
	}
	
	public void saveOrder(Order order) {
		ordersDao.insert(order);
	}
	
	//주문 완료상태에서(배송완료가 아님) 취소 버튼을 누를경우 취소상태로
	//일단 만들어놓음
	public void cancelOrder(int orderNo) {
		ordersDao.updateOrderStatus(orderNo);
	}
	
	public void updateOrder(Order order) {
		ordersDao.updateOrder(order);
	}
	
	public void removeOrder(int orderNo) {
		ordersDao.delete(orderNo);
	}
}
