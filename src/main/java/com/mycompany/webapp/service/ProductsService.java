package com.mycompany.webapp.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductsDao;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Products;

@Service
public class ProductsService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductsService.class);
	@Autowired ProductsDao productsDao;
	public List<Products> pSelectAll(){
		List<Products> list = productsDao.pSelectAll();
		return list;
	}	
	
	public List<Products> pSelectAll(Pager pager){
		List<Products> list = productsDao.pSelectByPage(pager);
		return list;
	}	
	
	public int getTotalRows(int pcategory) {
		int rows = productsDao.count(pcategory);
		return rows;
	}
	
	public List<Products> getTotalDate(Pager pager) {
		List<Products> rows = productsDao.count_date(pager);
		return rows; 
	}
	public List<Products> getTotalName(Pager pager) {
		List<Products> rows = productsDao.count_name(pager);
		return rows; 
	}

	public List<Products> getTotalLow(Pager pager) {
		List<Products> rows = productsDao.count_low(pager);
		return rows; 
	}

	public List<Products> getTotalHigh(Pager pager) {
		List<Products> rows = productsDao.count_high(pager);
		return rows; 
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
