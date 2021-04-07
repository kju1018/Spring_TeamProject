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
import com.mycompany.webapp.dto.ProductQnas;
import com.mycompany.webapp.service.ProductQnasService;

@Controller
@RequestMapping("/product")
public class ProductQnasController {
	private static final Logger logger = LoggerFactory.getLogger(CommunityQnaController.class);
	@Autowired
	private ProductQnasService productQnasService;
	
	@GetMapping("/product_qna_list")
	   public String productQnaList(int productno, String pageNo, Model model, HttpSession session) {

	      //페이지 번호
	      //새션에서 pager를 찾고, 있으면 pageNo를 설정하고
	      int intPageNo = 1; 
	      if(pageNo == null) {
	         Pager pager = (Pager) session.getAttribute("pager");
	         if(pager != null) {
	            intPageNo = pager.getPageNo();
	         }   
	      }else {
	         intPageNo = Integer.parseInt(pageNo);
	      }
	   
	      int totalRows = productQnasService.getTotalRows(productno);
	      Pager pager = new Pager(5,5,totalRows, intPageNo, productno);
	      session.setAttribute("pager", pager);
	      
	      List<ProductQnas> list = productQnasService.SelectByProductno(pager);
	      model.addAttribute("list", list);// 왼쪽: jsp 오른쪽은 위에 list
	      model.addAttribute("pager", pager);
	      return "product/p_qna_list";

	   }

	@GetMapping("/myqna_list")
	public String communityMyBoardList(String pageNo, Model model, HttpSession session, Authentication auth) {

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
          
		int totalRows = productQnasService.getTotalRow(auth.getName());
		Pager pager = new Pager(6, 5, totalRows, intPageNo, auth.getName());
		session.setAttribute("pager", pager);
		List<ProductQnas> list = productQnasService.getBoardListById(pager);
		model.addAttribute("list", list); //오른쪽이 위에 list 왼쪽이 jsp에서 쓸 이름
		model.addAttribute("pager", pager);
		return "product/p_qna_list";
	}
	
	@GetMapping("/p_qna_write")
	public String productQnaWrite(int productno, Model model, Authentication auth) {
		String userid = "";
		userid = auth.getName();
		
		model.addAttribute("userid", userid);
		model.addAttribute("productno",productno);
		logger.info("userid");
		
		return "product/p_qna_write";
	}

	@PostMapping("/createqna")
	public String communityQnaCreate(ProductQnas productqna, HttpSession session, Model model) {
		productqna.setBcount(0);
		productqna.setGrouplayer(0);
		
		logger.info(productqna.toString());
		productQnasService.pqnaInsert(productqna);
		return "redirect:/product/product_view_user?productno=" + productqna.getProductno();

	}
	
	@GetMapping("/p_qna_view")
	public String productQnaView(int boardno, Model model, Authentication auth) {
		productQnasService.paddBcount(boardno);
		ProductQnas productqna = productQnasService.getBoard(boardno);
		model.addAttribute("productqna", productqna); // model객체를 이용해서, view로 data 전달
		model.addAttribute("userid", auth.getName());
		// model.addAttribute("변수이름", "변수에 넣을 데이터값"); 그러면 스프링은 그 값을 뷰쪽으로 넘겨준다.
		//뷰(.jsp)파일에서는 ${}를 이용해서 값을 가져온다.
		return "product/p_qna_view";
	}
	
	@GetMapping("/qna_update")
	public String communityQnaUpdateForm(int boardno, Model model) {
		ProductQnas productqna = productQnasService.getBoard(boardno);
		model.addAttribute("productqna", productqna);
		
		return "product/p_qna_update";
	}

	@PostMapping("/pupdateqna")
	public String communityQnaUpdate(ProductQnas productqna) {
		productQnasService.pqnaUpdate(productqna);
		
		return "redirect:/product/p_qna_view?boardno=" + productqna.getBoardno();
	}

	@GetMapping("/pdeleteqna")
	public String productQnaDelete(int boardno, ProductQnas productqna) {
		productQnasService.pqnaDelete(boardno);
		
		return "redirect:/product/product_view_user?productno=" + productqna.getProductno();
	}
}
