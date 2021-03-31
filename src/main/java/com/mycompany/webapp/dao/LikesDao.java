package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Likes;

@Mapper
public interface LikesDao {
	public List<Likes> likeSelectAll(); //좋아요 전체선택
	public int lInsert(Likes likes);
	public int lUpdate(Likes likes);
	public int LDelete(int productno);
	
}
