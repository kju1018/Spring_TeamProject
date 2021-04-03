package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.OrderProduct;

@Mapper
public interface OrderProductsDao {
	
	//주문 물품 생성
	public int insert(OrderProduct orderproduct);
	
	//특정 유저에 주문 물품 리스트
	public List<OrderProduct> selectByUserId(String userid);
	
	public int delete(OrderProduct orderproduct);
	
	
	public int insertByList(List<OrderProduct> orderProductList);
	
	
	//주문 물품 업데이트(필요없을듯)
	public int updateOrderProduct(OrderProduct orderproduct);

	//(묶음 배송일경우) 주문 번호로 다 삭제
	//하지만 이건 안쓰일듯 (order삭제로 cascade설정)
	public int deleteByOrderNo(int orderno);
//	public int delete() 
	//OrderProduct를 삭제하려면 orderno, productno둘 다 필요 물어봐야함
	//필요 없을수도있음
	
	//주문 번호가 하나로 통일될경우 orders를 삭제
	//이건 jsp로 보여주는걸 고민
	
	//주문 번호가 따로따로 되어있을경우 OrderProduct삭제
	//이건 delete 고민
}
