package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductQnasDao;
import com.mycompany.webapp.dto.ProductQnas;

@Service
public class ProductQnasService {
	@Autowired ProductQnasDao productQnaDao;
	public List<ProductQnas> pQanSelectAll(){
		List<ProductQnas> list = productQnaDao.pQanSelectAll();
		return list;
	}
	
	public void pQnaInsert(ProductQnas productqnas) {
		productQnaDao.pQnaInsert(productqnas);
	}
	
	public void pQnaUpdate(ProductQnas productqnas) {
		productQnaDao.pQnaUpdate(productqnas);
	}
	
	public void pQnaDelete(int boardno) {
		productQnaDao.pQnaDelete(boardno);
	}
	

}
