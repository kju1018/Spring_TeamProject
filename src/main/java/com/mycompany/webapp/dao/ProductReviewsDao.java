package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.ProductReviews;

@Mapper
public interface ProductReviewsDao {
	public List<ProductReviews> prSelectAll();
	public List<ProductReviews> prSelectByPno(Pager pager);	
	public int count(int productno);
	public int prInsert(ProductReviews productrivews);
	public int prUpdate(ProductReviews productrivews);
	public int prDelete(int boardno);
	
}
