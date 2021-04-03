package com.mycompany.webapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.CommunityQna;
import com.mycompany.webapp.dto.Pager;



@Mapper
public interface CommunityQnasDao {
	public List<CommunityQna> selectByPage(Pager pager);
	public CommunityQna selectByBoardno(int boardno); //번호에 해당하는 board를 가져옴
	public List<CommunityQna> selectByUserid(Pager pager);
	public List<CommunityQna> selectByKeyword(Map<String, Object> map);
	
	public int insert(CommunityQna communityqna); //안에 board는 board service
	public int update(CommunityQna communityqna);
	public int updateBcount(int boardno);
	public int deleteByBoardno(int boardno);

	public int count();
	public int countuser(String userid);
	public int countkeyword(Map<String, String> map);
	
	//리플저장
	public int insertRepl(CommunityQna communityqna); 
}
