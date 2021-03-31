<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form id="cart_form" onsubmit="checkCart()" action="<%=application.getContextPath()%>/order/order_form" method="post">
	<table class="table" style="margin-top: 30px;">
			<tr>
				<th><input type="checkbox" name="" id="checkAll" onclick="selectAll(this)"/></th>
				<th width="25%">제품사진</th>
				<th width="25%">상품정보</th>
				<th width="15%">수량</th>
				<th width="10%"></th>
				<th width="15%">구매금액</th>
				<th width="10%">배송비</th>
			</tr>
			
			<c:if test="${empty cartList}">
				<tr class="cart_list" >
					<td colspan="7" class="text-center p-5">
						장바구니가 비어있습니다.
					</td>
				</tr>
				<c:set var="total" value="${0}"/>
			</c:if>
	
			<c:if test="${not empty cartList}">
					<c:forEach var="cart" items="${cartList}">
						<tr class="cart_list" >
							<th class="align-middle"><input type="checkbox" name="cart_box" class="checkSelect" value="${cart.productno}"/></th>
							<th class="align-middle">
								<a href="<%=application.getContextPath()%>/product/product_view?productno=${cart.productno}">
									<img src = "<%=application.getContextPath()%>/resources/image/lamp1.png" width="80px">
								</a>
							</th>
							<th class="align-middle"><a href="<%=application.getContextPath()%>/product/product_view?productno=${cart.productno}">${cart.pname}</a></th>
							<th class="align-middle">
								<input type="number" min="1" id="cartquantity${cart.productno}" value="${cart.cartquantity}" style="width:50%">
								
							</th>
							<th class="align-middle"><a class="btn btn-outline-dark btn-sm" style="width:100%" onclick="updatecartquantity(${cart.productno})">변경</a></th>
							<th class="align-middle">${cart.cartquantity*cart.pprice}</th>
							<th class="align-middle">무료</th>
						</tr>
						<c:set var="total" value="${total+cart.cartquantity*cart.pprice}"/>
					</c:forEach>
			</c:if>
	</table>
		<div class="c-middle">
			<input type="button" class="btn btn-dark btn-sm" onclick="cartdelete()" value="선택상품삭제"/>
			<input type="button" class="btn btn-dark btn-sm" onclick="deleteAll(${cartList.size()})" value="상품전체 삭제"/>
		</div>
	<table class="table" style="margin-top: 30px;">
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
		<button class="btn btn-dark">상품주문</button>
		<input  type="button" class="btn btn-dark" value="쇼핑계속하기" onclick="location.href ='<%=application.getContextPath()%>'">
	</div>
	
</form>