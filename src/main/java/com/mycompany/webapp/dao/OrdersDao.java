package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Order;

@Mapper
public interface OrdersDao {
	//주문번호로 주문 조회
	public Order selectByOrderNo(int orderno);
	
	//주문 생성
	public int insert(Order order);
	
	//주문 상태 변경(취소) 아니면 나중에 스트링으로 하나 더 받기
	public int updateOrderStatus(int orderno);
	
	//주문 정보 변경
	public int updateOrder(Order order);
	
	//주문 삭제
	public int delete(int orderno);
	
	
	
	//특정 유저의 주문 내역 리스트(안쓰일듯)
	public List<Order> selectByUserId(String userid);
}
