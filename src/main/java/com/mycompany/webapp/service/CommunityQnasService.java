package com.mycompany.webapp.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.CommunityQnasDao;
import com.mycompany.webapp.dto.CommunityQna;
import com.mycompany.webapp.dto.Pager;

@Service
public class CommunityQnasService {
	private static final Logger logger = 
			LoggerFactory.getLogger(CommunityQnasService.class);
	@Autowired
	private CommunityQnasDao communityqnasDao;
	
	public List<CommunityQna> getBoardList() {
		List<CommunityQna> list = communityqnasDao.selectAll();
		return list;
	}
	
	public List<CommunityQna> getBoardList(Pager pager) {
		List<CommunityQna> list = communityqnasDao.selectByPage(pager);
		return list;
	}	
	
	public void saveBoard(CommunityQna communityqna) {
		logger.info("저장전 bno:"+ communityqna.getBoardno());
		communityqnasDao.insert(communityqna);
		logger.info("저장 후 bno:" + communityqna.getBoardno());
	}

	public CommunityQna getBoard(int boardno) {
		CommunityQna communityqna = communityqnasDao.selectByBoardno(boardno);
		return communityqna;
	}

	public void updateBoard(CommunityQna communityqna) {
		communityqnasDao.update(communityqna);
	}
	
	public void deleteBoard(int boardno) {
		communityqnasDao.deleteByBoardno(boardno);
	}
	
	public void addBcount(int boardno) {
		communityqnasDao.updateBcount(boardno);
	}

	public int getTotalRows() {
		int rows = communityqnasDao.count();
		return rows;
	}
	
	public List<CommunityQna> getBoardListById(String userid){
		List<CommunityQna> list = communityqnasDao.selectByUserid(userid);
		return list;
	}
}
