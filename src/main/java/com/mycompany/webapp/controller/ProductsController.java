package com.mycompany.webapp.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.ProductImgs;
import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.service.ProductImgsService;
import com.mycompany.webapp.service.ProductsService;

@Controller
@RequestMapping("/product")
public class ProductsController {
	private static final Logger logger = LoggerFactory.getLogger(ProductsController.class);
	@Autowired
	private ProductsService productsService;
	@Autowired
	private ProductImgsService productImgsService;
	
	
	/*ADMIN*======================================================/
	/*상품 상세 - admin*/
	@GetMapping("/product_view")
	public String product_view(Model model, int productno) {
		Products productnum = productsService.pSelectByPno(productno);
		model.addAttribute("productnum", productnum);	
		return "product/product_view";
	}
	
	/*상품 리스트 - admin*/
	@GetMapping("/product_list")
	public String product_list(Model model) {
		List<Products> list = productsService.pSelectAll();
		model.addAttribute("list", list);	
		return "product/product_list";
	}
	
	/*상품 추가 폼으로 이동 - admin*/
	@GetMapping("/product_insert")
	public String product_insert() {
		return "product/product_insert";
	}
	
	/*상품 추가 폼에서 입력한 값 DB에 저장 - admin*/
	@PostMapping("/insert") //jsp에서 값 얻기
	public String insert(Products products) {
		productsService.pInsert(products);
		return "redirect:/list/product_list";
	}
	
	/*업데이트할 상품 번호 받기 - admin*/
	@GetMapping("/product_update_num")
	public String product_update_num() {
		return "product/product_update_num";
	}
	
	/*업데이트할 상품 번호 있는지 확인 - admin*/
	@PostMapping(value ="/update_num", produces = "text/html; charset=UTF-8") //jsp에서 값 얻기
	@ResponseBody
	public String update_num(Products products, Model model) {
		int num = products.getProductno();
		if(productsService.pSelectByPno(num) != null) {
			logger.info("데이터 있음");
			model.addAttribute("num", num);
			return "<script>"+"location.href=\"/webapp/product/product_update\";"+"</script>";
		}else {
			logger.info("데이터 없음");
			//스크립트 쓰니까 redirect가 안먹힘
			//String msg = "<script>alert('No productno');</script>";
			return "<script>"
			         + "alert(\"데이터가 없습니다.\");"
			         + "location.href=\"/webapp/product/product_update_num\";"
			         + "</script>";
		}		
	}
	
	/*번호가 있을 경우 수정할 정보 입력 - admin*/
	@GetMapping("/product_update")
	public String product_update(Products products) {
		//productsService.pSelectByPno(products.getProductno());
		return "product/product_update";
	}
	
	/*상품 업데이트 폼에서 입력한 값 DB에 저장 - admin*/
	@PostMapping("/update") //jsp에서 값 얻기
	public String update(Products products) {
		logger.info(products.getPname());
		//productsService.pSelectByPno();
		
		productsService.pUpdate(products);	
		return "redirect:/list/product_list";
	}
	
	/*USER*======================================================/
	/*상품 상세*/
	@SuppressWarnings("null")
	@GetMapping("/product_view_user")
	public String product_view_user(Model model, int productno) {
		Products productnum = productsService.pSelectByPno(productno);
		List<ProductImgs> productimg = productImgsService.pImgSelectByIno(productno);
		for(int i=0; i<productimg.size(); i++) {
			logger.info(productimg.get(i).getIoriginalname());
		}
		
//		List<ProductImgs> iprioritys = null;
//		ProductImgs ipriority = null;
//		for(int i=0; i<productimg.size(); i++) {
//			if(productimg.get(i).getIpriority()==1) {
//				logger.info("");
//				ipriority = productimg.get(i);
//			}else {
//				iprioritys.add(productimg.get(i));
//			}
//		}
		model.addAttribute("productnum", productnum);
//		model.addAttribute("ipriority", ipriority);	
//		model.addAttribute("iprioritys", iprioritys);			
		return "product/product_view_user";
	}
	
	/*상품 리스트*/
	@GetMapping("/product_list_user")
	public String product_list_user(Model model) {
		//model옆에 int categoryno / if categoryno = 1이면 인테리어조명 ... //
		List<Products> list = productsService.pSelectAll();
		model.addAttribute("list", list);	
		return "product/product_list_user";
	}

}