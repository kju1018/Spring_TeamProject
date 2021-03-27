package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.ProductQnas;

@Mapper
public interface ProductQnasDao {
	public List<ProductQnas> pQanSelectAll(); //게시판 목록 전체
	public ProductQnas pQnaInsert(ProductQnas productqnas); //게시판 입력
	public int pQnaUpdate(ProductQnas productqnas); //게시판 업데이트
	public int pQnaDelete(int boardno); //게시판 삭제
	
}
