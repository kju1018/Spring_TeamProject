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

import com.mycompany.webapp.dto.CommunityQna;
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
	public String productReviewList(String pageNo, Products products, Model model, HttpSession session) {
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
			
		int totalRows = productReviewsService.getTotalRows(products.getProductno());
		Pager pager = new Pager(3, 5, totalRows, intPageNo, products.getProductno()); // 페이징 객체 생성
		session.setAttribute("pager", pager);	    
		List<ProductReviews> previews = productReviewsService.prSelectByPno(pager);
		model.addAttribute("previews", previews);
		model.addAttribute("products",products);
		return "product/product_review_list";
	}
	
	@GetMapping("/myproduct_review_list")
	public String myProductReviewList(String pageNo, Model model, HttpSession session, Authentication auth) {

        int intPageNo = 1;
        if(pageNo == null) {
        //세션에서 Pager를 찾고, 있으면 pageNo를 설정
        	Pager pager = (Pager) session.getAttribute("p_review_pager");
			if(pager != null) {
				logger.info("페이저");
				intPageNo = pager.getPageNo();
			}
        } else {
           intPageNo = Integer.parseInt(pageNo);
        }
        
        int totalRows = productReviewsService.getTotalRows(auth.getName());
        Pager pager = new Pager(6, 5, totalRows, intPageNo, auth.getName());
        session.setAttribute("p_review_pager", pager);
        List<ProductReviews> list = productReviewsService.prSelectByUserId(pager);
		logger.info(pager.getPageNo()+"");
		model.addAttribute("list", list); //오른쪽이 위에 list 왼쪽이 jsp에서 쓸 이름
		model.addAttribute("pager", pager);
		return "product/myproduct_review_list";
	}
	
	@PostMapping("/review_write_form")
	public String reviewWirteForm(ProductReviews productreviews, Model model, Authentication auth) {
		List<ProductReviews> list = productReviewsService.prUser(productreviews.getProductno());
		for(int i=0; i< list.size(); i++) {
			if(list.get(i).getUserid() == auth.getName()) {
				logger.info("구매한 사람");
			}else {
				logger.info("구매하지 않음.");
			}
		}
		logger.info("product 넘 : "+Integer.toString(productreviews.getProductno()));
		//int pno = productreviews.getProductno();
		model.addAttribute("productreviews", productreviews);
		return "product/review_write_form";
	}

	@PostMapping(value="/review_write", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String reviewWrite(ProductReviews productreviews, Authentication auth) {
		logger.info(Integer.toString(productreviews.getProductno()));
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
		
		/*
		 * logger.info("컨텐트 : "+productreviews.getBcontent());
		 * logger.info("타이틀 : "+productreviews.getBtitle());
		 * logger.info("유저네임 : "+auth.getName());
		 * logger.info("프로덕트 넘 : "+Integer.toString(productreviews.getProductno()));
		 */
		
		productreviews.setUserid(auth.getName());
		List<ProductReviews> list = productReviewsService.prUser(productreviews.getProductno());
		for(int i=0; i< list.size(); i++) {
			if(list.get(i).getUserid() == auth.getName()) {
				logger.info("구매한 사람");
			}else {
				logger.info("구매하지 않음.");
			}
		}
		productReviewsService.prInsert(productreviews);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		return jsonObject.toString();
	}


	@GetMapping("/review_view")
	public String reviewView(ProductReviews productreviews, Model model) {
		logger.info("보드 넘 : "+Integer.toString(productreviews.getBoardno()));
		int bno = productreviews.getBoardno();
		productReviewsService.prUpdateCount(bno);
		ProductReviews reviews =  productReviewsService.prSelectByBno(bno);
		//logger.info("컨텐트 : "+reviews.getBcontent());
		//logger.info("btitle : "+reviews.getBtitle());
		model.addAttribute("reviews", reviews);
		return "product/review_view";
	}
	
	@GetMapping(value="/delete_review", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String deleteReview(ProductReviews productreviews) {
		int bno = productreviews.getBoardno();
		productReviewsService.prDelete(bno);
		JSONObject jsonobject = new JSONObject();
	    jsonobject.put("result", "success");
	    return jsonobject.toString();
	}
	
	@GetMapping("/review_update_form")
	public String reviewUpdateForm(ProductReviews bno, Model model) {
		int rvbno = bno.getBoardno();
		logger.info("업데이트 폼 프로덕트 넘 : "+Integer.toString(bno.getBoardno()));
			
		ProductReviews productreviews = productReviewsService.prSelectByBno(rvbno);
		logger.info("업데이트 폼 프로덕트 넘2 : "+Integer.toString(productreviews.getBoardno()));
		logger.info("업데이트 폼 컨텐트 넘2 : "+productreviews.getBcontent());
		//logger.info("업데이트 폼 프로덕트 넘2 : "+Integer.toString(productreviews.getBoardno()));
				
		model.addAttribute("productreviews", productreviews);
		return "product/review_update_form";
	}
	
	@PostMapping(value="/review_update", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String reviewUpdate(ProductReviews productreviews) {		
		logger.info("업데이트 보드 넘 : "+Integer.toString(productreviews.getBoardno()));
		productReviewsService.prUpdate(productreviews);
		JSONObject jsonobject = new JSONObject();
	    jsonobject.put("result", "success");
	    return jsonobject.toString();
	}
}
