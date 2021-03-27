package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.User;

@Mapper
public interface UsersDao {
	
	//관리자
	// 관리자가 모든 유저 검색
	public List<User> selectAll ();
	//관리자가 특정 유저 검색
	public User selectbyUserid(String Uid);
	
	//회원가입 (추가)
	public int userInsert(User user);
	
	//회원수정 (수정)
	public int userUpdate(User user);
	
	//회원탈퇴 (status를 수정하는 형태로)
	public int userStatusUpdate(String Uid);
	
	
}
