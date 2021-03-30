package com.mycompany.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.CommunityQna;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.CommunityQnasService;


@Controller
@RequestMapping("/community")
public class CommunityQnaController {
	private static final Logger logger =
			LoggerFactory.getLogger(CommunityQnaController.class);
	
	@Autowired
	private CommunityQnasService communityQnasService; 
	
	@RequestMapping("/qna_list")
	public String communityQnaList(Model model) {
		return "community/qna_list";
	}
	
	@GetMapping("/answer_view")
	public String answerView(int boardno, Model model) {
		communityQnasService.addBcount(boardno);
		CommunityQna communityqna = communityQnasService.getBoard(boardno);
		model.addAttribute("communityqna", communityqna);
		return "community/answer_view";
		
	}
	
	@GetMapping("/qna_list")
	public String communityQnaList1(
		String pageNo, Model model, HttpSession session) {
			
			int intPageNo = 1;
			if(pageNo == null) {
			//세션에서 Pager를 찾고, 있으면 pageNo를 설정
			Pager pager = (Pager) session.getAttribute("pager");
				if(pager != null) {
					intPageNo = pager.getPageNo();
				}
			} else {
				intPageNo = Integer.parseInt(pageNo);
			}
			
			
			int totalRows = communityQnasService.getTotalRows();
			Pager pager = new Pager(6, 5, totalRows, intPageNo);
			session.setAttribute("pager", pager);
			
			List<CommunityQna> list = communityQnasService.getBoardList(pager);
			model.addAttribute("list", list);
			model.addAttribute("pager", pager);
		return "community/qna_list";
	}

	@GetMapping("/qna_write")
	public String communityQnaWrite(HttpSession session) {
		
	    	  return "community/qna_write";
	      
		
	}
	
	@PostMapping("/create")
	public String communityQnaCreate(CommunityQna communityqna, HttpSession session) {
		
			communityqna.setBoardno(1);
			communityqna.setUserid("user1");
			communityQnasService.saveBoard(communityqna);
			logger.info(communityqna.getBtitle());
			return "redirect:/community/qna_list";
		 
		
	}
	
	@GetMapping("/qna_view")
	public String communityQnaView(int boardno, Model model) {
		communityQnasService.addBcount(boardno);
		CommunityQna communityqna = communityQnasService.getBoard(boardno);
		model.addAttribute("communityqna", communityqna);
		return "community/qna_view";
	}
	
	@GetMapping("/qna_update")
	public String communityQnaUpdateForm(int boardno, Model model) {
		CommunityQna communityqna = communityQnasService.getBoard(boardno);
		model.addAttribute("communityqna", communityqna);
		return "community/qna_update";
	}
	
	@PostMapping("/update")
	public String communityQnaUpdate(CommunityQna communityqna) {
		communityQnasService.updateBoard(communityqna);
		return "redirect:/community/qna_view";
	}
	
	@GetMapping("/delete")
	public String communityQnaDelete(int boardno) {
		communityQnasService.deleteBoard(boardno);
		return "redirect:/community/qna_list";
	}
}
