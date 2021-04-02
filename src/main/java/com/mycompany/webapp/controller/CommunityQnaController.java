package com.mycompany.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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
	private static final Logger logger = LoggerFactory.getLogger(CommunityQnaController.class);

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

	@GetMapping("/answer_write")
	public String AnswerqnaWrite(HttpSession session) {

		return "community/answer_write";
	}

	@PostMapping("/replcreate")
	public String AnswercreateCreate(CommunityQna communityqna, HttpSession session) throws Exception {

		communityqna.setUserid("user1");
		communityQnasService.saveRepl(communityqna);
		return "redirect:/community/qna_list";

	}

	@GetMapping("/qna_list")
	public String communityBoardList(String pageNo, Model model, HttpSession session, String searchType, String keyword) {
		
		if (keyword == null || keyword.equals("")) {
			session.removeAttribute("keyword");
			
			int intPageNo = 1;
			if (pageNo == null) {
				Pager pager = (Pager) session.getAttribute("allPager");
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
			model.addAttribute("list", list); // 오른쪽이 위에 list 왼쪽이 jsp에서 쓸 이름
			model.addAttribute("allPager", pager);
		} else {
			int intPageNo = 1;
			
			String sessionKeyword = (String) session.getAttribute("keyword");
			if(sessionKeyword != null && sessionKeyword.equals(keyword)) {
				if (pageNo == null) {
					Pager pager = (Pager) session.getAttribute("keywordPager");
					if(pager != null) {
						intPageNo = pager.getPageNo();
					}
				} else {
					intPageNo = Integer.parseInt(pageNo);
				}
			} else {
				session.setAttribute("keyword", keyword);
			}

			int totalRows = communityQnasService.getTotalRows(searchType, keyword);
			Pager pager = new Pager(6, 5, totalRows, intPageNo);
			session.setAttribute("keywordPager", pager);

			List<CommunityQna> list = communityQnasService.getBoardListByKeyword(pager, searchType, keyword);
			model.addAttribute("list", list); // 오른쪽이 위에 list 왼쪽이 jsp에서 쓸 이름
			model.addAttribute("pager", pager);
			model.addAttribute("searchType", searchType);
			model.addAttribute("keyword", keyword);
		}

		return "community/qna_list";
	}

	@GetMapping("/qna_write")
	public String communityQnaWrite(HttpSession session) {

		return "community/qna_write";
	}

	@PostMapping("/create")
	public String communityQnaCreate(CommunityQna communityqna, HttpSession session) {

		communityqna.setUserid("user1");
		communityQnasService.saveBoard(communityqna);
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

	@PostMapping("/updateqna")
	public String communityQnaUpdate(CommunityQna communityqna) {
		communityQnasService.updateBoard(communityqna);
		return "redirect:/community/qna_view?boardno=" + communityqna.getBoardno();
	}

	@GetMapping("/deleteqna")
	public String communityQnaDelete(int boardno) {
		logger.info(String.valueOf(boardno));
		communityQnasService.deleteBoard(boardno);
		return "redirect:/community/qna_list";
	}
}
