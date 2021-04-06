package com.mycompany.webapp.controller;

import java.io.File;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.ProductReviews;
import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.service.ProductReviewsService;

@Controller
@RequestMapping("/product")
public class ProductReviewsController {
	private static final Logger logger = LoggerFactory.getLogger(ProductReviewsController.class);

	@Autowired
	private ProductReviewsService productReviewsService;

	@RequestMapping("/product_review_list")
	public String productReviewList(String pageNo, Products pro, Model model, HttpSession session) {
		int intPageNo = 1;
		if (pageNo == null) { // 클라이언트에서 pageNo가 넘어오지 않았을 경우
			// 세션에서 Pager를 찾고, 있으면 pageNo를 설정
			Pager pager = (Pager) session.getAttribute("pager");
			if (pager != null) {
				intPageNo = pager.getPageNo();
			}
		} else { // 클라이언트에서 pageNo가 넘어왔을 경우
			intPageNo = Integer.parseInt(pageNo);
		}  
			
		int totalRows = productReviewsService.getTotalRows(pro.getProductno());
		Pager pager = new Pager(3, 5, totalRows, intPageNo, pro.getProductno()); // 페이징 객체 생성
		session.setAttribute("pager", pager);	    
		List<ProductReviews> previews = productReviewsService.prSelectByPno(pager);
		model.addAttribute("previews", previews);
		return "product/product_review_list";
	}
	
	@GetMapping("/review_write_form")
	public String reviewWirteForm() {
		return "product/review_write_form";
	}

	@PostMapping(value="/review_write", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String reviewWrite(ProductReviews productreviews, Authentication auth) {
		MultipartFile battach = productreviews.getBattach();
		if (battach != null && !battach.isEmpty()) {
			productreviews.setBorgimg(battach.getOriginalFilename());
			productreviews.setBimgtype(battach.getContentType());
			String saveName = new Date().getTime() + "-" + productreviews.getBorgimg();
			productreviews.setBsaveimg(saveName);
			File file = new File("C:/team5_spring_img/image/" + productreviews.getBsaveimg());
			try {
				battach.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		logger.info("컨텐트 : "+productreviews.getBcontent());
		logger.info("타이틀 : "+productreviews.getBtitle());
		logger.info("유저네임 : "+auth.getName());
		logger.info("프로덕트 넘 : "+Integer.toString(productreviews.getProductno()));
		logger.info("보드 넘 : "+Integer.toString(productreviews.getBoardno()));
		
		
		productreviews.setUserid(auth.getName());
		productReviewsService.prInsert(productreviews);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		return jsonObject.toString();
	}


}
