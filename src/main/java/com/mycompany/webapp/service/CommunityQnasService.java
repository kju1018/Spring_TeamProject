package com.mycompany.webapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
//	public List<CommunityQna> getBoardList() {
//		List<CommunityQna> list = communityqnasDao.selectAll();
//		return list;
//	}
	
	public List<CommunityQna> getBoardList(Pager pager) {
		List<CommunityQna> list = communityqnasDao.selectByPage(pager);
		return list;
	}	
	
	public void saveBoard(CommunityQna communityqna) {
		logger.info("저장전 bno:"+ communityqna.getBoardno());
		communityqnasDao.insert(communityqna);
		logger.info("저장 후 bno:" + communityqna.getBoardno());
	}
	
	public void saveRepl(CommunityQna communityqna) {
		logger.info("저장전 bno:"+ communityqna.getBoardno());
		communityqnasDao.insertRepl(communityqna);
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
	
	public int getTotalRow(String userid) {
		int rows = communityqnasDao.countuser(userid);
		return rows;
	}
	
	public int getTotalRows(String searchType, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		int rows = communityqnasDao.countkeyword(map);
		return rows;
	}
	
	public List<CommunityQna> getBoardListById(Pager pager){
		List<CommunityQna> list = communityqnasDao.selectByUserid(pager);
		return list;
	}
	
	public List<CommunityQna> getBoardListByKeyword(Pager pager, String searchType, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		map.put("startRowNo", pager.getStartRowNo());
		map.put("endRowNo", pager.getEndRowNo());
		List<CommunityQna> list = communityqnasDao.selectByKeyword(map);
		return list;
	}
	
	


	
//	public List<CommunityQna> getSearchList(Pager pager, String keyword) {
//		List<CommunityQna> list = communityqnasDao.getSearchList(pager, keyword);
//		return list;
//	}
//	
//	public List<CommunityQna> getSearchuserList(Pager pager, String keyword) {
//		List<CommunityQna> list = communityqnasDao.getSearchListuser(pager, keyword);
//		return list;
//	}
}
