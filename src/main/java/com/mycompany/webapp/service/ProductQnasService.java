package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductQnasDao;
import com.mycompany.webapp.dto.ProductQnas;

@Service
public class ProductQnasService {
	@Autowired ProductQnasDao productQnasDao;
	public List<ProductQnas> pQanSelectAll(){
		List<ProductQnas> list = productQnasDao.pQanSelectAll();
		return list;
	}
	
	public void pQnaInsert(ProductQnas productqnas) {
		productQnasDao.pQnaInsert(productqnas);
	}
	
	public void pQnaUpdate(ProductQnas productqnas) {
		productQnasDao.pQnaUpdate(productqnas);
	}
	
	public void pQnaDelete(int boardno) {
		productQnasDao.pQnaDelete(boardno);
	}
	

}
