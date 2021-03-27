package com.mycompany.webapp.dao;

import java.util.List;

import com.mycompany.webapp.dto.Order;

public interface OrdersDao {
	public Order selectByOrderNo(int orderNo);
	public List<Order> selectByUserId(String userId);
	public int insert(Order order);
	public int updateOrderStatus(int orderNo);
	public int updateOrder(Order order);
	public int delete(int orderNo);
}
