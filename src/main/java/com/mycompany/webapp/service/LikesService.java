package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.LikesDao;
import com.mycompany.webapp.dto.Likes;

@Service
public class LikesService {
	@Autowired
	private LikesDao likesDao;
	public List<Likes> likeSelectAll(){
		List<Likes> list = likesDao.likeSelectAll();
		return list;
	}
	
	public void lInsert(Likes likes) {
		likesDao.lInsert(likes);
	}
	
	public void lUpdate(Likes likes) {
		likesDao.lUpdate(likes);
	}
	
	public void LDeleteByProductNo(int productno) {
		likesDao.LDeleteByProductNo(productno);
	}
}
