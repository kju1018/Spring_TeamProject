package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.OrderProduct;

@Mapper
public interface OrderProductsDao {
	public int insert(OrderProduct orderProduct);
	public List<OrderProduct> selectByUserId(String userId);
	public int updateOrderProduct(OrderProduct orderProduct);
//	public int delete() 
	//OrderProduct를 삭제하려면 orderno, productno둘 다 필요 물어봐야함
	//필요 없을수도있음
	
	//주문 번호가 하나로 통일될경우 orders를 삭제
	//이건 jsp로 보여주는걸 고민
	
	//주문 번호가 따로따로 되어있을경우 OrderProduct삭제
	//이건 delete 고민
}
