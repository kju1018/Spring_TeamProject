package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Cart;

@Mapper
public interface CartsDao {
	public int insert(Cart cart);
	public List<Cart> selectByUserId(String userid);
	public int delete(List<Cart> cartlist);//선택삭제
	public int deleteAllByUserId(String userid);//전체 삭제
	public int updateCart(Cart cart);
}
