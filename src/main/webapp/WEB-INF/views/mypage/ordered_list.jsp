<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
.tempdd{
	    border-radius: 12px;
	    box-shadow: 0px 1px 5px 0px gray;
	    background-color: rgb(255, 255, 255);
	    margin-bottom: 20px;
	    padding: 24px 24px;
    }
</style>

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
	
	<div class="my_button mb-4">
		<input type='button' value="주문내역" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/ordered_list'">
		<input type='button' value="회원정보" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/mypage_update'">
		<input type='button' value="좋아요" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/like_list'">
		<input type='button' value="게시물관리" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/post_list'">
		<input type='button' value="장바구니" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/cart'">
	</div>
	
	<!--게시판-->
	<c:forEach items="${orderList}" var="order">
		<div class="tempdd">
			<table class="orderedtable table">
				 <thead>
					<tr>
						<th width="20%"><span >주문 일자: <fmt:formatDate value="${order.odate}" pattern="yyyy-MM-dd"/></span></th>
						<th width="20%"></th>
						<th width="10%"></th>
						<th width="10%"></th>
						<th width="15%"></th>
						<th width="25%">주문번호: ${order.orderno}</th>
					</tr>
				</thead>
				
				<c:forEach items="${order.orderproductlist}" var="orderproduct">
					<tr class="ordered_list" onclick="location.href ='<%=application.getContextPath()%>/product/product_view'">
						<th><img class="rounded" src = "<%=application.getContextPath()%>/resources/image/lamp1.png" width="80px"></th>
						<th>${orderproduct.pname}</th>
						<th></th>
						<th>${orderproduct.pprice} 원</th>
						<th>수량: ${orderproduct.oquantity}개</th>
						<th>${order.ostatus}</th>
					</tr>
				</c:forEach>
			</table>
			<div>
				
			
			</div>
		</div>
	<!--게시판-->
	</c:forEach>
    
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