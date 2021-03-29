package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CartsDao;
import com.mycompany.webapp.dto.Cart;

@Service
public class CartsService {
	@Autowired
	private CartsDao cartsDao;
	
	public void createCart(Cart cart) {
		cartsDao.insert(cart);
	}
	
	public List<Cart> getCartList(String userid) {
		List<Cart> list = cartsDao.selectByUserId(userid);
		return list;
	}
	
	//카트 개별 삭제
	public void removeCart(List<Cart> cartList) {
		cartsDao.delete(cartList);
	}
	
	//카트 전체 삭제
	public void removeCartAll(String userid) {
		cartsDao.deleteAllByUserId(userid);
	}
	
	public void updateCart(Cart cart) {
		cartsDao.updateCart(cart);
	}
}
