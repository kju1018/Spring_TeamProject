<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>


<!-- 전체 컨텐츠 영역 -->
<div class='container' style="margin-top: 12em;">
	<!-- 오른쪽 상단 계단 메뉴-->
    <ol class="sm_navi">
        <li class="sm_nav">홈 > </li>
        <li class="sm_nav">마이페이지 > </li>
        <li class="sm_nav">주문내역</li>
    </ol>
    <br/>
	<img src="<%=application.getContextPath()%>/resources/image/slide/slide10.PNG" class="container">
	
    <!--제목-->
	<p class='titleyj'>주문 내역</p>
	
	<div class="my_button">
		<input type='button' value="주문내역" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/ordered_list'">
		<input type='button' value="회원정보" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/mypage_update'">
		<input type='button' value="좋아요" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/like_list'">
		<input type='button' value="게시물관리" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/post_list'">
		<input type='button' value="장바구니" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/cart'">
	</div>
	
	<!-- 검색창 -->
	<div class='find_zone'>
	<input type='text' name='findStr' />
	<input type='button' value='검색' id='btnFind' name='select' onclick="location.href ='<%=application.getContextPath()%>/mypage/ordered_list'"/>
	</div>
	
	<!--게시판-->
	<table class="table">
		<tr>
            <th><input type="checkbox" name="" id="checkAll" onclick="selectAll(this)"/></th>
			<th width="20%">주문번호/주문일자</th>
			<th width="30%">제품사진</th>
			<th width="20%">상품정보</th>
			<th width="10%">수량</th>
			<th width="10%">구매금액</th>
			<th width="10%">구매상태</th>
		</tr>
		
		<tr class="ordered_list" onclick="location.href ='<%=application.getContextPath()%>/product/product_view'">
            <th><input type="checkbox" name="chk_box" class="checkSelect"/></th>
			<th>A12341234/2021-03-08</th>
			<th><img src = "<%=application.getContextPath()%>/resources/image/lamp1.png" width="50"></th>
			<th>북유럽풍 조명 장식</th>
			<th>2</th>
			<th>268000</th>
			<th>취소</th>
		</tr>
		
		<tr class="ordered_list" onclick="location.href ='<%=application.getContextPath()%>/product/product_view'">
            <th><input type="checkbox" name="chk_box" class="checkSelect"/></th>
			<th>A56785678/2021-02-02</th>
			<th><img src = "<%=application.getContextPath()%>/resources/image/lamp2.png" width="50"></th>
			<th>스칸디나비아 주방 식탁</th>
			<th>1</th>
			<th>10000000</th>
			<th>-</th>
		</tr>
	</table>
	<!--게시판-->

    
    <br/>
    <br/>

    <!-- 페이지 -->
    <ul class="pagenav">
        <li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_first.gif"></li>
        <li class="page-item"><a href="#">PREV</a></li>
        <li class="page-item"><a href="#">1</a></li>
        <li class="page-item"><a href="#">NEXT</a></li>
        <li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_last.gif"></li>
    </ul>
    <!-- 페이지 -->

	<div class="c_bottom">
		<input type="button" class="btn btn-dark" value="메인화면으로" onclick="location.href ='<%=application.getContextPath()%>'">
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>