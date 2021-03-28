package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrderProductsDao;
import com.mycompany.webapp.dto.OrderProduct;

@Service
public class OrderProductsService {
	
	
	@Autowired
	private OrderProductsDao orderProductsDao;
	
	
	public void createOrderProduct(OrderProduct orderProduct) {
		orderProductsDao.insert(orderProduct);
	}
	
	public List<OrderProduct> getOrderProducts(String userid){
		List<OrderProduct> list = orderProductsDao.selectByUserId(userid);
		return list;
	}
	
	public void updateOrderProduct(OrderProduct orderProduct) {
		orderProductsDao.updateOrderProduct(orderProduct);
	}
	
	public void delete(int orderno) {
		orderProductsDao.delete(orderno);
	}
}
