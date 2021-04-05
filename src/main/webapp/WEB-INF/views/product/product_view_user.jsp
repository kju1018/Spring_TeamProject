<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script type="text/javascript">
<%-- 
const insertcartquantity = (productno) => { //add to cart에 productno + productquantity 넘기기
	  const pquant = document.getElementById('quantity').value;
	  alert(pquant);
	  location.href ="<%=application.getContextPath()%>/cart/create_cart?productno="+productno+"&cartquantity="+pquant;
	};
 --%>
$(function(){
		reviewList();
 });

const reviewList = () => {
	const productno = ${products.productno};
	$.ajax({
		url: "product_review_list",
		method: "get",
		data: productno
	}).then(data => {
		$('#review_board').html(data);
	});	
};



/* const reviewList = () => {
	const productno = ${products.productno};
	var productlist = {"productno": productno};
	$.ajax({
		url: "product_review_list",
		method: "get",
		data: productlist
	}).then(data => {
		$('#review_board').html(data);
	}); 
};
 */	
const cartComfirm = () => {
			const productno = ${products.productno};			
			const cartquantity = document.getElementById('pquantity').value;
			
			$.ajax({
				url:"<%=application.getContextPath()%>/cart/create_cart",
				data: {productno, cartquantity},
				method: "get"
			}).then(data => {
				console.log(data);
				if(data.result=="failure"){
				alert("이미 장바구니에 있습니다.");
			}else if(data.result=="success"){
				alert("장바구니에 추가했습니다.");
			}else{
				alert("로그인")
			}
	});	
}

	
const sumtotal = (pprice) => { //총합 계산 & 재고 계산
	const num = document.getElementById('pquantity').value;
	if(num > ${products.pstock}){
		alert("재고가 없습니다.");
		document.getElementById('pquantity').value = ${products.pstock};
		num = document.getElementById('pquantity').value;
		document.getElementById('totalprice').innerHTML = (num*pprice)+" 원";
		document.getElementById('price').innerHTML = (num*pprice)+" 원";
  }
	if(num > 0){
		document.getElementById('totalprice').innerHTML = (num*pprice)+" 원";
		document.getElementById('price').innerHTML = (num*pprice)+" 원";
		}else{
			alert("최소 수량은 1개 이상입니다.");
			document.getElementById('pquantity').value = 1;
		}	
}	

const changeimg1 = (product_img) => { //이미지 클릭시 변경
	var imgs = document.getElementById("detail_img1");
	imgs.src="<%=application.getContextPath()%>/resources/image/"+product_img;
}	

const changeimg2 = (product_img) => {
	var imgs = document.getElementById("detail_img1");
	imgs.src="<%=application.getContextPath()%>/resources/image/"+product_img;
}	

const changeimg3 = (product_img) => {
	var imgs = document.getElementById("detail_img1");
	imgs.src="<%=application.getContextPath()%>/resources/image/"+product_img;
}		

const changeimg4 = (product_img) => {
	var imgs = document.getElementById("detail_img1");
	imgs.src="<%=application.getContextPath()%>/resources/image/"+product_img;
}	
</script>

<div class="container-fluid" style="margin-top:15%">
    <div class="row justify-content-center" >
	    <div class="col-12" style="width:100%;" id="photo1" >		    
		    <div id="photo2" style="float:left; width:35%; margin-left:14%;">
		    		<img src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${products.isavename}&type=${products.imgtype}" style="margin-top:10px; width:100%; height:500px;" name="detail_img1" id="detail_img1"><br>		    
            <img onclick="changeimg1('${productimg[0].ioriginalname}')" src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${productimg[0].isavename}&type=${productimg[0].imgtype}" style="width:25%; height:100px;" name="detail_img2" id="detail_img2">
            <img onclick="changeimg2('${productimg[1].ioriginalname}')" src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${productimg[1].isavename}&type=${productimg[1].imgtype}" style="width:25%; height:100px;" name="detail_img3" id="detail_img3">
            <img onclick="changeimg3('${productimg[2].ioriginalname}')" src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${productimg[2].isavename}&type=${productimg[2].imgtype}" style="width:24%; height:100px;" name="detail_img4" id="detail_img4">
            <img onclick="changeimg4('${productimg[3].ioriginalname}')" src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${productimg[3].isavename}&type=${productimg[3].imgtype}" style="width:23.3%; height:100px;" name="detail_img5" id="detail_img5">
					
        </div><!-- photo2 -->
            
  
				  <!-- 값 넘길 때  href="read?bno=${board.bno}
				  read jsp의 ?뒤의 bno는 넘길 곳의 변수명 / 뒤에는 내쪽에서 넘기는 변수명-->
				    <!--product -->				  
					<div id="photo_subject" style="float:left; width:35%; margin-left:3%;">
					<hr style="width:100%; color: black; border:1px solid black;"/>
					<p style="font-size: large;">${products.pname}</p><br><br>
					<pre><small style="color: gray;">판매가		${products.pprice}원<br><br>배송비		무료<br><br></pre>
				    (최소주문수량 1개 이상)<img src="<%=application.getContextPath()%>/resources/image/like_sora.png" style="width:10%; height:10%; margin-left:63%;">
				    
				    </small>
					<!--수량 선택-->
					<form action="<%=application.getContextPath()%>/order/order_form" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="isCart" value="0"/>
						<input type="hidden" name="chk_productno" value="${products.productno}"/>
						    <table style="width:100%; height:80px; border:1px solid lightgray;">
										<tr>
											<td><small><img src="<%=application.getContextPath()%>/resources/image/icon_sora.gif"><b>수량을 선택해주세요. ${procuts.pstock}</b>
			                <br><br>${products.pname}</small><input onclick="sumtotal(${products.pprice})" type="number" id="pquantity" name="quantity" value="1" style="width:8%; margin-left:40%;">
			                <small style="margin-left:27%;"><span id="price">${products.pprice}원</span></small></td>
			                
										</tr>
								</table> 
					    <!--구매 / 장바구니-->
						<br><small style="margin-left:70%;">TOTAL:</small>&nbsp;<b><span id="totalprice">${products.pprice} 원</span></b><small>(1개)</small><br><br>
						<!-- form으로 -->
						
						<button type="submit" class="btn btn-dark" style="width:100%" role="button">BUY IT NOW</button><br><br>
						</form>
						<button onclick="cartComfirm()" class="btn btn-white btn-outline-dark" style="width:100%">ADD TO CART</button><br><br>
							<!-- insertcartquantity(${products.productno}) -->
					</div>
					<br><br>
				</div><!-- photo_subject -->	
			</div><!-- photo1 --><br><br>

    <hr style="border:1px solid lightgray"/>
	<div >
        <p style="margin-left:12%; font-size: large;">Product Detail</p>
  </div><br>
    <!--상품 상세 이미지-->
    <div style="height:auto; margin-left: 5%">
    	<c:if test="${products.detailimgoname != null}">	
            	<img src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${products.detailimgsname}&type=${products.detailimgtype}" width="100%"/>            
       </c:if>      
	  </div>
   
    <!--제품 리뷰-->   
 		<div id="review_board">
 		
 		</div>

<%--  <c:import url="/product_review_list">
		<c:param name="products" value="${products}"></c:param>	
	</c:import>
 --%>
    <!--제품 Q&A-->
    <div >
        <p style="margin-left:12%; margin-bottom: 0px; font-size: large;">Q&A</p>
    </div><br>
    <div class="row justify-content-center">
        <table class="table col-9" style="text-align: center;">
            <thead class="thead">
              <tr style="background-color: lightgray;">
                <th scope="col">번호</th>
                <th scope="col"style="width:18%">카테고리</th>
                <th scope="col" style="width:33%">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
                <th scope="col">조회</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td> </td>
                <td><a href="<%=application.getContextPath()%>/product/p_qna_view" class="text-black-50">재입고 문의 드립니다.</a></td>
                <td>ㅎㅎ</td>
                <td>2021-03-10</td>
                <td>10</td>
                
              </tr>
              
            </tbody>
          </table>
        </div>
        <div style="margin-left: 80%;">
        <a class="btn btn-white btn-outline-dark" href="<%=application.getContextPath()%>/product/p_qna_write" role="button">상품문의하기</a>
        </div>

        <div class="row justify-content-md-center">
            <a href="#none"><img src="<%=application.getContextPath()%>/resources/image/btn_page_first.gif"></a> 
            <a href="#none" class="text-black-50">PREV</a> 
            <a href="#none" class="thisPageNumber text-black-50">1</a>
            <a href="#none" class="text-black-50">NEXT</a>
            <a href="#none"><img src="<%=application.getContextPath()%>/resources/image/btn_page_last.gif"></a>
            
        </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>