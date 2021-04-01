<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script type="text/javascript">
const insertcartquantity = (productno) => { //add to cart에 productno + productquantity 넘기기
	  const pquant = document.getElementById('quantity').value;
	  alert(pquant);
	  location.href ="<%=application.getContextPath()%>/cart/create_cart?productno="+productno+"&cartquantity="+pquant;
	};
	

	
const sumtotal = (pprice) => { //총합 계산
	const num = document.getElementById('pquantity').value;
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
	imgs.src="<%=application.getContextPath()%>/resources/image/light4_sora.png";
}	

const changeimg3 = (product_img) => {
	var imgs = document.getElementById("detail_img1");
	imgs.src="<%=application.getContextPath()%>/resources/image/light5_sora.png";
}		

const changeimg4 = (product_img) => {
	var imgs = document.getElementById("detail_img1");
	imgs.src="<%=application.getContextPath()%>/resources/image/light6_sora.png";
}	
</script>

<div class="container-fluid" style="margin-top:15%">
    <div class="row justify-content-center" >
	    <div class="col-12" style="width:100%;" id="photo1" >
		    
		    <div id="photo2" style="float:left; width:35%; margin-left:14%;">	
            <img src="<%=application.getContextPath()%>/resources/image/${products.ioriginalname}" style="margin-top:10px; width:100%; height:500px;" name="detail_img1" id="detail_img1"><br> 							
            <img onclick="changeimg1('${productimg[0].ioriginalname}')" src="<%=application.getContextPath()%>/resources/image/${productimg[0].ioriginalname}" style="width:25%; height:100px;" name="detail_img2" id="detail_img2">
            <img onclick="changeimg2('${productimg[1].ioriginalname}')" src="<%=application.getContextPath()%>/resources/image/${productimg[1].ioriginalname}" style="width:25%; height:100px;" name="detail_img3" id="detail_img3">
            <img onclick="changeimg3('${productimg[2].ioriginalname}')" src="<%=application.getContextPath()%>/resources/image/${productimg[2].ioriginalname}" style="width:24%; height:100px;" name="detail_img4" id="detail_img4">
            <img onclick="changeimg4('${productimg[3].ioriginalname}')" src="<%=application.getContextPath()%>/resources/image/${productimg[3].ioriginalname}" style="width:23.3%; height:100px;" name="detail_img5" id="detail_img5">

        </div><!-- photo2 -->
            
  
				  <!-- 값 넘길 때  href="read?bno=${board.bno}
				  read jsp의 ?뒤의 bno는 넘길 곳의 변수명 / 뒤에는 내쪽에서 넘기는 변수명-->
				    <!--product -->				  
					<div id="photo_subject" style="float:left; width:35%; margin-left:3%;">
					<hr style="width:100%; color: black; border:1px solid black;"/>
					<p style="font-size: large;">${products.pname}</p><br><br>
					<pre><small style="color: gray;">판매가		${products.pprice}원<br><br>배송비		2,500원(30,000원 이상 구매 시 무료)<br><br></pre>
				    (최소주문수량 1개 이상)<img src="<%=application.getContextPath()%>/resources/image/like_sora.png" style="width:10%; height:10%; margin-left:63%;">
				    
				    </small>
					<!--수량 선택-->
					<form action="<%=application.getContextPath()%>/order/order_form" method="post">
					
						<input type="hidden" name="chk_productno" value="${products.productno}"/>
						    <table style="width:100%; height:80px; border:1px solid lightgray;">
										<tr>
											<td><small><img src="<%=application.getContextPath()%>/resources/image/icon_sora.gif"><b>수량을 선택해주세요.</b>
			                <br><br>${products.pname}</small><input onclick="sumtotal(${products.pprice})" type="number" id="pquantity" name="quantity" value="1" style="width:8%; margin-left:40%;">
			                <small style="margin-left:27%;"><span id="price">${products.pprice}원</span></small></td>
			                
										</tr>
								</table> 
					    <!--구매 / 장바구니-->
						<br><small style="margin-left:73%;">TOTAL:</small>&nbsp;<b><span id="totalprice">${products.pprice} 원</span></b><small>(1개)</small><br><br>
						<!-- form으로 -->
						
						<button type="submit" class="btn btn-dark" style="width:100%" role="button">BUY IT NOW</button><br><br>
						</form>
						<button onclick="insertcartquantity(${products.productno})" class="btn btn-white btn-outline-dark" style="width:100%">ADD TO CART</button><br><br>
							
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
				<img src="<%=application.getContextPath()%>/resources/image/${products.detailimgoname}" style="width:100%">
    </div>
   
    <!--제품 리뷰-->
    <div style="clear: both;">
        <p style="margin-left:12%; margin-bottom: 0px; font-size: large;">REVIEW</p>
    </div><br>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <table class="table col-9" style="text-align: center";>
                <thead class="thead">
                    <tr style="background-color: lightgray;">
                        <th scope="col">번호</th>
                        <th scope="col" style="width:20%">상품정보</th>
                        <th scope="col" style="width:30%">제목</th>
                        <th scope="col">작성자</th>
                        <th scope="col">작성일</th>
                        <th scope="col">조회</th>
                    </tr>
                </thead>
                    <tbody>
                    <tr>
                        <th scope="row">3</th>
                        <td><img src="<%=application.getContextPath()%>/resources/image/light2_sora.png" style="width:30%"> 조명1</td>
                        <td><a href="<%=application.getContextPath()%>/product/review_view" class="text-black-50">실제가 더 좋아요~</a></td>
                        <td>ㅎㅎ</td>
                        <td>2021-03-10</td>
                        <td>10</td>
                        
                    </tr>
                <tr>
                    <th scope="row">2</th>
                    <td><img src="<%=application.getContextPath()%>/resources/image/light3_sora.png" style="width:30%"> 조명3</td>
                    <td><a href="<%=application.getContextPath()%>/product/review_view" class="text-black-50">너무 좋아요~</a></td>
                    <td>aa</td>
                    <td>2021-03-11</td>
                    <td>15</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td><img src="<%=application.getContextPath()%>/resources/image/light4_sora.png" style="width:30%"> 조명2</td>
                    <td><a href="<%=application.getContextPath()%>/product/review_view" class="text-black-50">상품후기 테스트</a></td>
                    <td>상품관리자</td>
                    <td>2021-03-10</td>
                    <td>3</td>
                </tr>
                </tbody>
            </table>
        </div> 
    </div> 
    <div style="margin-left: 83%;">
        <a class="btn btn-white btn-outline-dark" href="<%=application.getContextPath()%>/product/review_write" role="button">글 작성</a>
        </div>

    <div class="row justify-content-md-center">
        <a href="#none"><img src="<%=application.getContextPath()%>/resources/image/btn_page_first.gif"></a> 
        <a href="#none" class="text-black-50">PREV</a> 
        <a href="#none" class="thisPageNumber text-black-50">1</a>
        <a href="#none" class="text-black-50">NEXT</a>
        <a href="#none"><img src="<%=application.getContextPath()%>/resources/image/btn_page_last.gif"></a>
    </div><br><br><br>

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