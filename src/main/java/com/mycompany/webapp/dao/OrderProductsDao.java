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
}
