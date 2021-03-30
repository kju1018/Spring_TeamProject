<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script type="text/javascript">
const insertcartquantity = (productno) => {
	  const pquant = document.getElementById('pquantity').value;
	  alert(pquant);
	  location.href ="<%=application.getContextPath()%>/cart/create_cart?productno="+productno+"&cartquantity="+pquant;
	};
</script>

<div class="container-fluid" style="margin-top:15%">
    <div class="row justify-content-center" >
	    <div class="col-12" style="width:100%;" id="photo1" >
		    <div id="photo2" style="float:left; width:35%; margin-left:14%;">
                <img src="<%=application.getContextPath()%>/resources/image/light2_sora.png" style="margin-top:10px; width:100%; height:500px;"><br>			
                <img src="<%=application.getContextPath()%>/resources/image/light3_sora.png" style="width:25%; height:100px;">
                <img src="<%=application.getContextPath()%>/resources/image/light4_sora.png" style="width:25%; height:100px;">
                <img src="<%=application.getContextPath()%>/resources/image/light5_sora.png" style="width:24%; height:100px;">
                <img src="<%=application.getContextPath()%>/resources/image/light6_sora.png" style="width:23.3%; height:100px;">
            </div><!-- photo2 -->
  
  <!-- 값 넘길 때  href="read?bno=${board.bno}
  read jsp의 ?뒤의 bno는 넘길 곳의 변수명 / 뒤에는 내쪽에서 넘기는 변수명-->
    <!--product -->
  
	<div id="photo_subject" style="float:left; width:35%; margin-left:3%;">
	<hr style="width:100%; color: black; border:1px solid black;"/>
	<p style="font-size: large;">${productnum.pname}</p><br><br>
	<pre><small style="color: gray;">판매가		${productnum.pprice}원<br><br>배송비		2,500원(30,000원 이상 구매 시 무료)<br><br></pre>
    (최소주문수량 1개 이상)<img src="<%=application.getContextPath()%>/resources/image/like_sora.png" style="width:10%; height:10%; margin-left:63%;">
    
    </small>
	<!--수량 선택-->
    <table style="width:100%; height:80px; border:1px solid lightgray;">
		<tr>
			<td><small><img src="<%=application.getContextPath()%>/resources/image/icon_sora.gif"><b>수량을 선택해주세요.</b>
                <br><br>마켓디자인</small><input type="number" id="pquantity" name="pquantity" value="1" style="width:8%; margin-left:40%;">
                <small style="margin-left:27%;">${productnum.pprice}원</small></td>
                
		</tr>
	</table> 
    <!--구매 / 장바구니-->
	<br><small style="margin-left:73%;">TOTAL:</small>&nbsp;<b>${productnum.pprice}원</b><small>(1개)</small><br><br>
	<a href="<%=application.getContextPath()%>/payment" class="btn btn-dark" style="width:100%" role="button">BUY IT NOW</a><br><br>
	<button onclick="insertcartquantity(${productnum.productno})" class="btn btn-white btn-outline-dark" style="width:100%">ADD TO CART</button><br><br>
		
	</div>
	<br><br>
		</div><!-- photo_subject -->	
	</div><!-- photo1 --><br><br>
    <hr style="border:1px solid lightgray"/>
	<div >
        <p style="margin-left:12%; font-size: large;">Product Detail</p>
    </div><br>
    <!--상품 상세 이미지-->
    <div style="height:auto">
        <div style="width:55%; float:left;">
                <img src="<%=application.getContextPath()%>/resources/image/light7_sora.jpg" style="width:72%; height:25%; margin-left:21%"><br><br>
                <img src="<%=application.getContextPath()%>/resources/image/light8_sora.jpg" style="width:72%; height:25%; margin-left:21%"><br><br>
                <img src="<%=application.getContextPath()%>/resources/image/light9_sora.jpg" style="width:72%; height:25%; margin-left:21%"><br><br>
                <img src="<%=application.getContextPath()%>/resources/image/light10_sora.jpg" style="width:72%; height:25%; margin-left:21%"><br><br>
        </div><br>
        <!--상품 상세 설명-->
        <div style="width:35%; float:left; text-align: center; margin-right: 10%; height:100%">
                <div style="margin-top:60%; color:gray;" >
                    <small>
                        고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. <br>
                        확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이<br> 
                        아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.<br>  

                        무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 <br>
                        혹은 가까운 은행에서 직접 입금하시면 됩니다.  <br>
                        주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, <br>
                        7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.</small>
                    </div>

                    <div style="margin-top:100%; color:gray">
                        <small>
                            배송 방법 : 택배<br>
                            배송 지역 : 전국지역<br>
                            배송 비용 : 2,500원<br>
                            배송 기간 : 3일 ~ 7일<br>
                            배송 안내 : - 산간벽지나 도서지방은 별도의 <br>
                            추가금액을 지불하셔야 하는 경우가 있습니다.<br>
                            고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. <br>
                            다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.</small>
                        </div>

                        <div style="margin-top:110%; color:gray">
                            <small>
                                # 교환 및 반품 주소<br>
                                - [12345]서울 송파구 중대로 135<br>

                                # 교환 및 반품이 가능한 경우<br>
                                - 상품을 공급 받으신 날로부터 7일이내 <br>
                                단, 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.<br>
                                - 공급받으신 상품 및 용역의 내용이 표시.광고 내용과<br>
                                다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, <br>
                                그사실을 알게 된 날로부터 30일이내</small>
                            </div>

                            <div style="margin-top:110%; margin-bottom: 37%; color:gray">
                                <small>
                                    # 교환 및 반품이 불가능한 경우<br>
                                    - 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. <br>
                                    단, 상품의 내용을 확인하기 위하여<br>
                                      포장 등을 훼손한 경우는 제외<br>
                                    - 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우<br>
                                      (예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터, <br>
                                      디지털 카메라 등의 불량화소에 따른 반품/교환은 제조사 기준에 따릅니다.)<br>
                                    - 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 
                                    단, 화장품등의 경우 시용제품을 제공한 경우에 한 합니다.<br>
                                    - 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우<br>
                                    - 복제가 가능한 상품등의 포장을 훼손한 경우<br>
                                      (자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)</small>
                            </div>
            </div>
    </div><br>
   
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