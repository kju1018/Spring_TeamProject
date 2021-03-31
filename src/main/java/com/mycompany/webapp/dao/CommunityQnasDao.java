    package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CommunityQna;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.PagerUser;


@Mapper
public interface CommunityQnasDao {
//	public List<CommunityQna> selectAll();
	public List<CommunityQna> selectByPage(Pager pager);
	public int insert(CommunityQna communityqna); //안에 board는 board service
	public CommunityQna selectByBoardno(int boardno);
	public int update(CommunityQna communityqna);
	public int deleteByBoardno(int boardno);
	public int updateBcount(int boardno);
	public int countuser(String userid);
	public int count();
	public List<CommunityQna> selectByUserid(PagerUser pageruser);
	
	
	 //리플저장
	public int insertRepl(CommunityQna communityqna); 
	public List<CommunityQna> getSearchList(String keyword);



}
