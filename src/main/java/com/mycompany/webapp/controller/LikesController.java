package com.mycompany.webapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Likes;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.service.LikesService;

@Controller
@RequestMapping("/likes")
public class LikesController {
	
	private static final Logger logger = LoggerFactory.getLogger(LikesController.class);
	@Autowired
	private LikesService likesService ;
	
	@GetMapping(value = "/likeinsert", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String likeinsert(int  productno, Authentication auth) {
		String userid = "";
		JSONObject jsonObject = new JSONObject();
		int pno = productno;
		
		try {
			userid = auth.getName();
			
		}catch(Exception e) {
			
		}
		int result = likesService.lInsert(userid, pno);
		
		if(result == 1) {
			jsonObject.put("result", pno);
			return jsonObject.toString();
		}else {
			jsonObject.put("result", "null");
			return jsonObject.toString();
		}
	}
	
	@GetMapping(value = "/likedelete", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String likedelete(int  productno, Authentication auth, HttpSession session) {
		String userid = "";
		JSONObject jsonObject = new JSONObject();
		int pno = productno;
		
		try {
			userid = auth.getName();
			
		}catch(Exception e) {
			
		}
		int result = likesService.LDelete(userid, pno);
		int totalrows = likesService.totalLikelist(userid);
		int page =0;
		try {
			page = Integer.valueOf(session.getAttribute("page").toString());
		}catch(Exception e) {
			
		}
		if(totalrows % 5 == 0 && totalrows != 0) {
			page = Integer.valueOf(session.getAttribute("page").toString()) - 1;
			 
			session.setAttribute("page", page);
		}
		if(result == 1) {
			jsonObject.put("result", pno);
			jsonObject.put("page", page);
			return jsonObject.toString();
		}else {
			jsonObject.put("result", "null");
			return jsonObject.toString();
		}
	}
	
	@GetMapping(value="/alldelete",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public String alldelete(Authentication auth) {
		String userid = "";
		JSONObject jsonObject = new JSONObject();
		
		try {
			userid = auth.getName();
			
		}catch(Exception e) {
			
		}
		int result = likesService.allDelete(userid);
		
		if(result >=1) {
			logger.info("success");
			jsonObject.put("result", "success");
			return jsonObject.toString();
		}else {
			jsonObject.put("result", "fail");
			return jsonObject.toString();
		}
	}
	
	@GetMapping("/likelist")
	public String likelist(String pageNo, Authentication auth, Model model, HttpSession session) {
		String userid = "";
		int intPageNo = 1;
		if(pageNo == null) {
			//세션에서 Pager 를 찾고, 있으면 pageNo를 설정
			Pager pager = (Pager) session.getAttribute("pager");
			if(pager != null) {
				intPageNo = pager.getPageNo();
			}
		} else {
			intPageNo = Integer.parseInt(pageNo);
		}
		
		try {
			userid = auth.getName();
		}catch(Exception e) {
			return "redirect:/";
		}
		int totalrows = likesService.totalLikelist(userid);
		
		Pager pager = new Pager(5,5,totalrows, intPageNo);
		List<Products> productlikelist = new ArrayList();
		if(totalrows > 0) {
			 productlikelist = likesService.likelist(userid,pager.getStartRowIndex(), pager.getEndRowIndex());
		}
	
		
		logger.info("startrowno" + pager.getStartPageNo() +" ,endrowno" + pager.getEndRowNo() );
			if(productlikelist != null) {
			session.setAttribute("likelistpager", pager);
			session.setAttribute("page", pager.getPageNo());
			model.addAttribute("likeList", productlikelist);
			model.addAttribute("likelistpager", pager);
			model.addAttribute("number",totalrows);
		}
		

		
		return "mypage/like_list";
		
	}
}
