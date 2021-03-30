package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Products;

@Mapper
public interface ProductsDao {
	public List<Products> pSelectAll(); //상품 전체 조회
	public int pInsert(Products products); //상품 입력
	public int pUpdate(Products products); //상품 업데이트
	public Products pSelectByPno(int productno); //상품인덱스번호 찾기
	public int pDeleteByPno(int productno); //상품 삭제

}
