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

import com.mycompany.webapp.dto.Notice;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.service.NoticesService;

@Controller
@RequestMapping("/community")
public class NoticeController {
	private static final Logger logger =
			LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticesService noticesService;
	
	@RequestMapping("/notice_list")
	public String noticeList1(Model model) {
		return "community/notice_list";
	}
	
	@GetMapping("/notice_list")
	public String noticeList(String pageNo, Model model, HttpSession session) {
		int intPageNo = 1; 
	      if(pageNo == null) {
	         Pager pager = (Pager) session.getAttribute("pager");
	         if(pager != null) {
	            intPageNo = pager.getPageNo();
	         }   
	      }else {
	         intPageNo = Integer.parseInt(pageNo);
	      }
	   

	      int totalRows = noticesService.getTotalRows();
	      Pager pager = new Pager(7, 5, totalRows, intPageNo);
	      session.setAttribute("pager", pager);
	      
	      List<Notice> list = noticesService.getBoardList(pager);
	      model.addAttribute("list", list);
	      model.addAttribute("pager", pager);
		return "community/notice_list";
	}
	
	@GetMapping("/notice_write") //------------------------>막아줘
	public String noticeWrite(HttpSession session, Model model, Authentication auth) {
		String userid = "";
		userid = auth.getName();
		
		session.setAttribute("userid", userid);
		model.addAttribute("userid", userid);
		
	    return "community/notice_write";
	}
	
	@PostMapping("/create1") //------------------------>막아줘
	public String noticeCreate(Notice notice, HttpSession session) {
			noticesService.saveBoard(notice);

			return "redirect:/community/notice_list";

	}
	
	@GetMapping("/notice_view") //------------------------>막아줘
	public String noticeView(int boardno, Model model) {
		noticesService.addHitcount(boardno);
		Notice notice = noticesService.getBoard(boardno);
		model.addAttribute("notice", notice);
		return "community/notice_view";
	}
	
	@GetMapping("/notice_update") //------------------------>막아줘
	public String noticeUpdateForm(int boardno, Model model) {
		Notice notice = noticesService.getBoard(boardno);
		model.addAttribute("notice", notice);
		return "community/notice_update";
	}
	
	@PostMapping("/updatenoti") //------------------------>막아줘
	public String noticeUpdate(Notice notice) {
		noticesService.updateBoard(notice);
		return "redirect:/community/notice_view?boardno="+notice.getBoardno();
	}
	
	@GetMapping("/deletenoti") //------------------------>막아줘
	public String notieDelete(int boardno) {
		noticesService.deleteBoard(boardno);
		return "redirect:/community/notice_list";
	}
	
}
