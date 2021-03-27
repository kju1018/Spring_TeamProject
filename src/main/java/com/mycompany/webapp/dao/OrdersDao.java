package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Order;

@Mapper
public interface OrdersDao {
	public Order selectByOrderNo(int orderno);
	public List<Order> selectByUserId(String userid);
	public int insert(Order order);
	public int updateOrderStatus(int orderno);
	public int updateOrder(Order order);
	public int delete(int orderno);
}
