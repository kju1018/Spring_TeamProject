<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<body>
<!-- 전체 컨텐츠 영역 -->
<div class='container' style="margin-top: 12em;">
	<!-- 오른쪽 상단 계단 메뉴-->
    <ol class="sm_navi">
        <li class="sm_nav">홈 > </li>
        <li class="sm_nav">마이페이지 > </li>
        <li class="sm_nav">장바구니</li>
    </ol>
    <br/>
	<img src="<%=application.getContextPath()%>/resources/image/slide/slide10.PNG" class="container">
    <!--제목-->
	<p class='titleyj'>장바구니</p>

	<!--게시판-->
	<table class="table">
		<tr>
			<th><input type="checkbox" name="" id="checkAll" onclick="selectAll(this)"/></th>
			<th width="30%">제품사진</th>
			<th width="30%">상품정보</th>
			<th width="10%">수량</th>
			<th width="10%">구매금액</th>
			<th width="10%">배송비</th>
			<th width="10%"></th>
		</tr>
		<tr class="cart_list" onclick="location.href ='<%=application.getContextPath()%>/product/product_view'">
			<th><input type="checkbox" name="chk_box" class="checkSelect"/></th>
			<th><img src = "<%=application.getContextPath()%>/resources/image/lamp1.png" width="50"></th>
			<th>북유럽풍 조명 장식</th>
			<th>2</th>
			<th>268000</th>
			<th>무료</th>
			<th>
				<input type="button" class="btn-sel" value="주문하기">
				<input type="button" class="btn-sel" value="삭제">
			</th>
		</tr>
		<tr class="cart_list" onclick="location.href ='<%=application.getContextPath()%>/product/product_view'">
			<th><input type="checkbox" name="chk_box" class="checkSelect"/></th>
			<th><img src = "<%=application.getContextPath()%>/resources/image/lamp2.png" width="50"></th>
			<th>스칸디나비아 주방 식탁</th>
			<th>1</th>
			<th>10000000</th>
			<th>무료</th>
			<th>
				<input type="button" class="btn-sel" value="주문하기">
				<input type="button" class="btn-sel" value="삭제">
			</th>
		</tr>
	</table>
	<hr/>

	<div class="c-middle">
		<input type="button" class="btn btn-dark btn-sm" value="장바구니비우기">
	</div>	

	<!-- 페이지 -->
	<ul class="pagenav" style="margin-top: 40px;">
		<li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_first.gif"></li>
		<li class="page-item"><a href="#">PREV</a></li>
		<li class="page-item"><a href="#">1</a></li>
		<li class="page-item"><a href="#">NEXT</a></li>
		<li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_last.gif"></li>
	</ul>
	<br/>

	<table class="table" style="margin-top: 80px;">
	<tr>
		<th width="33%">총 상품금액</th>
		<th width="33%">총 배송비</th>
		<th width="33%">결제예정금액</th>
	</tr>
	<tr>
		<th>100,000</th>
		<th>+0 원</th>
		<th>= 100,000 원</th>
	</tr>
	</table>
	
	<div class="c_bottom">
		<input type="button" class="btn btn-dark" value="전체상품주문">
		<input type="button" class="btn btn-dark" value="쇼핑계속하기" onclick="location.href ='<%=application.getContextPath()%>'">
	</div>
								
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>