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

@Controller //controller는 model을 이용해 데이터를 가져오고 view에 데이터를 넘겨 적절한 view를 생성하는 역할
@RequestMapping("/community") //view의 요청 경로 지정
public class CommunityQnaController {
	private static final Logger logger = LoggerFactory.getLogger(CommunityQnaController.class);

	@Autowired
	private CommunityQnasService communityQnasService;

	@GetMapping("/qna_list") //view의 요청 경로 지정
	public String communityBoardList(String pageNo, Model model, HttpSession session, String searchType, String keyword) {
	//pageNo: 현재 페이지 번호
		
		if (keyword == null || keyword.equals("")) { //키워드가 널이거나 ""일 경우 (검색을 한번도 안 한 경우) 그냥 일반 페이징 처리된 목록
			session.removeAttribute("keyword"); //세션에 저장된 keyword값 삭제
			//removeAttribute(String name) 리턴타입 void, 이름이 name인 속성을 삭제
			
			int intPageNo = 1; //기본 1페이지 설정
			if (pageNo == null) { //현재 페이지 번호가 없을 경우(그럴일은 없음)
				Pager pager = (Pager) session.getAttribute("allPager"); 
				//getAttribute(String name) 리턴타입 Object, 이름이 name인 속성의 값을 구한다. 지정한 이름의 속성이 존재하지 않으면 null 리턴
				if(pager != null) { //현재 페이지 번호가 널이 아닐경우 페이지 번호 저장
					intPageNo = pager.getPageNo(); //getPageNo으로 현재 페이지번호 가져와서 intPageNo에 넣어줌
				}
			} else {
				intPageNo = Integer.parseInt(pageNo); 
			}

			int totalRows = communityQnasService.getTotalRows(); //totalRows: 전체 행수
			Pager pager = new Pager(6, 5, totalRows, intPageNo);
			// Pager (int rowsPerPage, int pagesPerGroup, int totalRows, int pageNo)
			// (페이지당 행수, 그룹당 페이지수, 전체 행수, 현재 페이지 번호)
			session.setAttribute("allPager", pager); 
			//setAttribut(String name, Object value) 리턴타입:void 이름이 속성의 값을 value로 지정
			List<CommunityQna> list = communityQnasService.getBoardList(pager);
			model.addAttribute("list", list); // 오른쪽이 위에 list 왼쪽이 jsp에서 쓸 이름
			model.addAttribute("pager", pager);
		} else {
			int intPageNo = 1;
			
			String sessionKeyword = (String) session.getAttribute("keyword");
			if(sessionKeyword != null && sessionKeyword.equals(keyword)) {
				if (pageNo == null) {
					Pager pager = (Pager) session.getAttribute("allPager");
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
			session.setAttribute("allPager", pager);

			List<CommunityQna> list = communityQnasService.getBoardListByKeyword(pager, searchType, keyword);
			model.addAttribute("list", list); // 뷰로 데이터 전달
			model.addAttribute("pager", pager);
			model.addAttribute("searchType", searchType);
			model.addAttribute("keyword", keyword);
		}

		return "community/qna_list";  //뷰 이름 리턴(뷰페이지 이름)
	}  //페이징 처리된 리스트 목록 가져오기
	
	@GetMapping("/myqna_list")
	public String communityMyBoardList(String pageNo, Model model, HttpSession session, Authentication auth) {

        int intPageNo = 1;
        if(pageNo == null) {
        //세션에서 Pager를 찾고, 있으면 pageNo를 설정
        Pager pager = (Pager) session.getAttribute("qna_pager");
           if(pager != null) {
              intPageNo = pager.getPageNo();
           }
        } else {
           intPageNo = Integer.parseInt(pageNo);
        }
         
         
        int totalRows = communityQnasService.getTotalRow(auth.getName());
        Pager pager = new Pager(6, 5, totalRows, intPageNo, auth.getName());
        session.setAttribute("qna_pager", pager);
        List<CommunityQna> list = communityQnasService.getBoardListById(pager);
        model.addAttribute("list", list); //오른쪽이 위에 list 왼쪽이 jsp에서 쓸 이름
        model.addAttribute("pager", pager);
		return "community/my_qna_list";
	}
	
	@GetMapping("/qna_write") // 막기
	public String communityQnaWrite(Model model, Authentication auth) {
		String userid = "";
		userid = auth.getName();
		
		model.addAttribute("userid", userid);
		
		logger.info("userid");
		return "community/qna_write";
	}

	@PostMapping("/create")  //막기
	public String communityQnaCreate(CommunityQna communityqna, HttpSession session, Model model, Authentication auth) {
		communityQnasService.saveBoard(communityqna);
		
		return "redirect:/community/qna_list";

	}
	
	@GetMapping("/qna_view")
	public String communityQnaView(int boardno, String searchType, String keyword, Model model, Authentication auth) {
		communityQnasService.addBcount(boardno);
		CommunityQna communityqna = communityQnasService.getBoard(boardno);
		model.addAttribute("communityqna", communityqna); // model객체를 이용해서, view로 data 전달
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		try {
		model.addAttribute("userid", auth.getName());
		} catch(Exception e) {
			
		}
		// model.addAttribute("변수이름", "변수에 넣을 데이터값"); 그러면 스프링은 그 값을 뷰쪽으로 넘겨준다.
		//뷰(.jsp)파일에서는 ${}를 이용해서 값을 가져온다.
		
		return "community/qna_view";
	}
	
	@GetMapping("/myqna_view")
	public String communityMyQnaView(int boardno, Model model, Authentication auth) {
		communityQnasService.addBcount(boardno);
		CommunityQna communityqna = communityQnasService.getBoard(boardno);
		model.addAttribute("communityqna", communityqna); // model객체를 이용해서, view로 data 전달
		model.addAttribute("userid", auth.getName());
		// model.addAttribute("변수이름", "변수에 넣을 데이터값"); 그러면 스프링은 그 값을 뷰쪽으로 넘겨준다.
		//뷰(.jsp)파일에서는 ${}를 이용해서 값을 가져온다.
		
		return "community/myqna_view";
	}

	@GetMapping("/qna_update") //막기
	public String communityQnaUpdateForm(int boardno, Model model) {
		CommunityQna communityqna = communityQnasService.getBoard(boardno);
		model.addAttribute("communityqna", communityqna);
		
		return "community/qna_update";
	}

	@PostMapping("/updateqna")//막기
	public String communityQnaUpdate(CommunityQna communityqna) {
		communityQnasService.updateBoard(communityqna);
		
		return "redirect:/community/qna_view?boardno=" + communityqna.getBoardno();
	}

	@GetMapping("/deleteqna") //막기
	public String communityQnaDelete(int boardno) {
		communityQnasService.deleteBoard(boardno);
		
		return "redirect:/community/qna_list";
	}

	@GetMapping("/answer_write") // 막기
	public String AnswerqnaWrite(int boardno, Authentication auth, Model model) {
		String userid = "";
		userid = auth.getName();
		CommunityQna communityQna = communityQnasService.getBoard(boardno);
		model.addAttribute("userid", userid);
		model.addAttribute("communityQna", communityQna);
		
		return "community/answer_write";
	}

	@PostMapping("/createrepl") // 막기
	public String communityReplCreate(CommunityQna communityqna, HttpSession session, Model model, Authentication auth) {
		communityqna.setBcount(0);
		communityqna.setGroupord(0);
		communityqna.setGrouplayer(1); // 답글은 1
		
		communityQnasService.saveRepl(communityqna);
		
		return "redirect:/community/qna_list";

	}
	
	@GetMapping("/answer_view") // 막기
	public String answerView(int boardno, Model model, Authentication auth) {
		communityQnasService.addBcount(boardno);
		CommunityQna communityqna = communityQnasService.getBoard(boardno);
		model.addAttribute("communityqna", communityqna);
		model.addAttribute("userid", auth.getName());
		return "community/answer_view?boardno=" + communityqna.getBoardno();

	}

	
}