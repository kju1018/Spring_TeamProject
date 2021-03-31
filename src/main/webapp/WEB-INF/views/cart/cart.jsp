<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script type="text/javascript">
	const cartdelete = (productno) => {
		if(confirm("정말 삭제하시겠습니까 ?") == true){
			location.href ="<%=application.getContextPath()%>/cart/delete?productno="+productno;
	    }
	    else{
	        return ;
	    }
	};
	
	const updatecartquantity = (productno) => {
		  const cartquantity = document.getElementById('cartquantity'+productno).value;
		  location.href ="<%=application.getContextPath()%>/cart/update_quantity?cartquantity="+cartquantity+"&productno="+productno;
		};
	
		
	const deleteAll = () => {
		const cartdelete = (productno) => {
			if(confirm("장바구니를 비우시겠습니까?") == true){
				 location.href ="<%=application.getContextPath()%>/cart/delete_allcart";
		    }
		    else{
		        return ;
		    }
		
	};
	
</script>


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
	
	<div class="my_button">
		<input type='button' value="주문내역" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/ordered_list'">
		<input type='button' value="회원정보" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/mypage_update'">
		<input type='button' value="좋아요" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/like_list'">
		<input type='button' value="게시물관리" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/post_list'">
		<input type='button' value="장바구니" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/cart'">
	</div>
	
	<!--게시판-->
	<table class="table" style="margin-top: 15px;">
		<tr>
			<th><input type="checkbox" name="" id="checkAll" onclick="selectAll(this)"/></th>
			<th width="30%">제품사진</th>
			<th width="25%">상품정보</th>
			<th width="15%">수량</th>
			<th width="10%">구매금액</th>
			<th width="10%">배송비</th>
			<th width="10%"></th>
		</tr>
		
		<c:if test="${empty cartList}">
			<tr class="cart_list" >
				<td colspan="7" class="text-center">
					장바구니가 비어있습니다.
				</td>
			</tr>
		
		</c:if>
		<c:if test="${not empty cartList}">
			<c:forEach var="cart" items="${cartList}">
				<tr class="cart_list" >
					<th><input type="checkbox" name="chk_box" class="checkSelect"/></th>
					<th>
						<a href="<%=application.getContextPath()%>/product/product_view">
							<img src = "<%=application.getContextPath()%>/resources/image/lamp1.png" width="50">
						</a>
					</th>
					<th><a href="<%=application.getContextPath()%>/product/product_view">${cart.pname}</a></th>
					<th>
						<div class="row">
							<div class="col-6">
								<input type="number" id="cartquantity${cart.productno}" value="${cart.cartquantity}" style="width:100%">
							</div>
							<div class="col-6">
								<a class="btn btn-outline-dark btn-sm" style="width:100%" onclick="updatecartquantity(${cart.productno})">확인</a>
							</div>
							
						</div>
							
							
							
					</th>
					<th>${cart.cartquantity*cart.pprice}</th>
					<th>무료</th>
					<th>
						<input type="button" class="btn-sel" value="주문하기" >
						<button id="cartdelete" class="btn-sel" onclick="cartdelete(${cart.productno})">삭제</button>
					</th>
				</tr>
				<c:set var="total" value="${total+cart.cartquantity*cart.pprice}"/>
			</c:forEach>
		</c:if>

	</table>
	<hr/>

	<div class="c-middle">
		<a type="button" class="btn btn-dark btn-sm" href="">상품전체 삭제</a>
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
		<th><c:out value="${total}"/>원</th>
		<th>+0 원</th>
		<th>= <c:out value="${total}"/>원</th>
	</tr>
	</table>
	
	<div class="c_bottom">
		<a type="button" class="btn btn-dark" >상품전체주문</a>
		<input  type="button" class="btn btn-dark" value="쇼핑계속하기" onclick="location.href ='<%=application.getContextPath()%>'">
	</div>
								
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>