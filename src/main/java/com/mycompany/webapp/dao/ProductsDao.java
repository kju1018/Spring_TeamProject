package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Products;

@Mapper
public interface ProductsDao {
	public List<Products> pSelectAll(); //상품 전체 조회
	public List<Products> pSelectByPage(Pager pager);//페이징 처리	
	public int count(int pcategory); //상품 전체 행수
	public List<Products> count_date(Pager pager); //날짜순 정렬
	public List<Products> count_name(Pager pager); //이름순 정렬
	public List<Products> count_low(Pager pager); //가격순 정렬
	public List<Products> count_high(Pager pager); //가격순 정렬
	
	public int pInsert(Products products); //상품 입력
	public int pUpdate(Products products); //상품 업데이트
	public Products pSelectByPno(int productno); //상품인덱스번호 찾기
	public int pDeleteByPno(int productno); //상품 삭제

	
}
