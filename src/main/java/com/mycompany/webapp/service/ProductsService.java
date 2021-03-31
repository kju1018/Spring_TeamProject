package com.mycompany.webapp.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.controller.ProductsController;
import com.mycompany.webapp.dao.ProductsDao;
import com.mycompany.webapp.dto.Products;

@Service
public class ProductsService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductsService.class);
	@Autowired ProductsDao productsDao;
	public List<Products> pSelectAll(){
		List<Products> list = productsDao.pSelectAll();
		return list;
	}	
	
	public void pInsert(Products products) {
		productsDao.pInsert(products);
	};
	public void pUpdate(Products products) {
		logger.info(products.getPname());
		productsDao.pUpdate(products);
	};

	
	public Products pSelectByPno(int productno){ 
		Products products = productsDao.pSelectByPno(productno); 
		return products; 
	};
	 	
	public void pDeleteByPno(int productno) {
		productsDao.pDeleteByPno(productno);
	}
	
}
