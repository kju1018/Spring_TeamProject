package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Cart;

@Mapper
public interface CartsDao {
	public int insert(Cart cart);
	public List<Cart> selectByUserId(String userid);
	public int delete(Cart cart);
	public int updateCart(Cart cart);
}
