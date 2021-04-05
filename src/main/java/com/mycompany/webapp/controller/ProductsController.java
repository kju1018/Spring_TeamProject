package com.mycompany.webapp.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.ProductImgs;
import com.mycompany.webapp.dto.Products;
import com.mycompany.webapp.service.ProductImgsService;
import com.mycompany.webapp.service.ProductReviewsService;
import com.mycompany.webapp.service.ProductsService;

@Controller
@RequestMapping("/product")
public class ProductsController {
	private static final Logger logger = LoggerFactory.getLogger(ProductsController.class);
	@Autowired
	private ProductsService productsService;
	@Autowired
	private ProductImgsService productImgsService;
	@Autowired
	private ProductReviewsService productReviewsService;
	
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
	@GetMapping("/product_view_user")
	public String product_view_user(Model model, int productno) {
		Products products = productsService.pSelectByPno(productno);
		List<ProductImgs> productimg = productImgsService.pImgSelectByPno(productno);
		model.addAttribute("products", products);
		logger.info("imgno : "+Integer.toString(productimg.get(0).getImgno()));
		model.addAttribute("productimg", productimg);
		
		return "product/product_view_user";
	}
	
	/*상품 사진*/
	@GetMapping("/downloadImags_detail")
	public void downloadImags_detail(String savename, String type, HttpServletResponse response) {
		try {
			response.setContentType(type);
			//String originalName = products.getDetailimgoname(); 
			//originalName = new String(originalName.getBytes("UTF-8"),"ISO-8859-1");
			//response.setHeader("Content-Disposition", "attachment; filename=\""+originalName+"\";");			
			InputStream is = new FileInputStream("C:/team5_spring_img/image/"+savename);
		    OutputStream os = response.getOutputStream();
		    FileCopyUtils.copy(is, os);
		    os.flush();
		    is.close();
		    os.close();			   
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	
	/*상품 리스트*/
	@GetMapping("/product_list_user")
	public String product_list_user(String pageNo, Model model, HttpSession session, int pcategory, String pcategoryname, int sort, String searchword) {
		  int intPageNo = 1;
		  
		  if(searchword == null || searchword.equals("")) {
		  if(pageNo == null) { //클라이언트에서 pageNo가 넘어오지 않았을 경우
			  //세션에서 Pager를 찾고, 있으면 pageNo를 설정
			  Pager pager = (Pager) session.getAttribute("pager");
			  if(pager != null) {
				  intPageNo = pager.getPageNo();
			  } 
		  }else { //클라이언트에서 pageNo가 넘어왔을 경우
			  intPageNo = Integer.parseInt(pageNo);
		  }	  
		  
	      int totalRows = productsService.getTotalRows(pcategory); //카테고리의 전체 행수
	      Pager pager = new Pager(10,5, totalRows, intPageNo, pcategory); //페이징 객체 생성
	      //원래 세션자리	      
	      List<Products> list = productsService.pSelectAll(pager); //행수 페이징 처리
	      switch(sort) {
	      case 1:
	    	  list = productsService.getTotalDate(pager);
	    	  break;
	      case 2:
	    	  list = productsService.getTotalName(pager);
	    	  break;	      
	      case 3:
	    	  list = productsService.getTotalLow(pager);
	    	  break;	    	  
	      case 4:
	    	  list = productsService.getTotalHigh(pager);
	    	  break;
	      case 5:
	    	  totalRows = productsService.getTotalRowsAll();
	    	  pager = new Pager(10,5, totalRows, intPageNo, pcategory); //페이징 객체 생성
	    	  list = productsService.pSelectBestPager(pager);
	    	  break;
	      case 6:
	    	  totalRows = productsService.getTotalRowsAll();
	    	  pager = new Pager(10,5, totalRows, intPageNo, pcategory); //페이징 객체 생성
	    	  list = productsService.pSelectDatePager(pager);
	    	  break;
	      case 7:
	    	  totalRows = productsService.getTotalRowsSearchword(searchword);
	    	  pager = new Pager(10,5, totalRows, intPageNo); //페이징 객체 생성
	    	  list = productsService.pSelectBySearchword(pager, searchword);
	    	  break;
	      default:
	    	  break;
      }
	    session.setAttribute("pager", pager);  	    
		model.addAttribute("list", list);
		model.addAttribute("sort", sort);
		model.addAttribute("pcategory", pcategory);
		model.addAttribute("pcategoryname", pcategoryname);
		  } else {
			  if(pageNo == null) { //클라이언트에서 pageNo가 넘어오지 않았을 경우
				  //세션에서 Pager를 찾고, 있으면 pageNo를 설정
				  Pager pager = (Pager) session.getAttribute("pager");
				  if(pager != null) {
					  intPageNo = pager.getPageNo();
				  } 
			  }else { //클라이언트에서 pageNo가 넘어왔을 경우
				  intPageNo = Integer.parseInt(pageNo);
			  }	  
			  
		      int totalRows = productsService.getTotalRows(pcategory); //카테고리의 전체 행수
		      Pager pager = new Pager(10,5, totalRows, intPageNo, pcategory); //페이징 객체 생성
		      //원래 세션자리	      
		      List<Products> list = productsService.pSelectAll(pager); //행수 페이징 처리
		      switch(sort) {
		      case 1:
		    	  list = productsService.getTotalDate(pager);
		    	  break;
		      case 2:
		    	  list = productsService.getTotalName(pager);
		    	  break;	      
		      case 3:
		    	  list = productsService.getTotalLow(pager);
		    	  break;	    	  
		      case 4:
		    	  list = productsService.getTotalHigh(pager);
		    	  break;
		      case 5:
		    	  totalRows = productsService.getTotalRowsAll();
		    	  pager = new Pager(10,5, totalRows, intPageNo, pcategory); //페이징 객체 생성
		    	  list = productsService.pSelectBestPager(pager);
		    	  break;
		      case 6:
		    	  totalRows = productsService.getTotalRowsAll();
		    	  pager = new Pager(10,5, totalRows, intPageNo, pcategory); //페이징 객체 생성
		    	  list = productsService.pSelectDatePager(pager);
		    	  break;
		      case 7:
		    	  totalRows = productsService.getTotalRowsSearchword(searchword);
		    	  pager = new Pager(10,5, totalRows, intPageNo); //페이징 객체 생성
		    	  list = productsService.pSelectBySearchword(pager, searchword);
		    	  break;
		      default:
		    	  break;
	      }
		    session.setAttribute("pager", pager);  	    
			model.addAttribute("list", list);
			model.addAttribute("sort", sort);
			model.addAttribute("pcategory", pcategory);
			model.addAttribute("pcategoryname", pcategoryname);
			model.addAttribute("searchword", searchword);
		  }
		
		return "product/product_list_user";
	}
	
}
