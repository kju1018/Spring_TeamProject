package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dto.Products;

@Service
public class ProductsService {
	@Autowired ProductsService productsDao;
	public List<Products> pSelectAll(){
		List<Products> list = productsDao.pSelectAll();
		return list;
	}	
	public void pInsert(Products products) {
		productsDao.pInsert(products);
	};
	public void pUpdate(Products products) {
		productsDao.pUpdate(products);
	};
	public List<Products> pSelectByPno(int productno) {
		List<Products> list = productsDao.pSelectByPno(productno);
		return list;
	};
	public void pDeleteByPno(int productno) {
		productsDao.pDeleteByPno(productno);
	}
}
