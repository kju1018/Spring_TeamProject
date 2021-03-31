<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<table class="table" style="margin-top: 30px;">
		<tr>
			<th><input type="checkbox" name="" id="checkAll" onclick="selectAll(this)"/></th>
			<th width="30%">제품사진</th>
			<th width="25%">상품정보</th>
			<th width="15%">수량</th>
			<th width="10%"></th>
			<th width="10%">구매금액</th>
			<th width="10%">배송비</th>
		</tr>
		
		<c:if test="${empty cartList}">
			<tr class="cart_list" >
				<td colspan="7" class="text-center">
					장바구니가 비어있습니다.
				</td>
			</tr>
			<c:set var="total" value="${0}"/>
		</c:if>
		<c:if test="${not empty cartList}">
			<c:forEach var="cart" items="${cartList}">
				<tr class="cart_list" >
					<th class="align-middle"><input type="checkbox" name="chk_box" class="checkSelect" value="${cart.productno}"/></th>
					<th class="align-middle">
						<a href="<%=application.getContextPath()%>/product/product_view">
							<img src = "<%=application.getContextPath()%>/resources/image/lamp1.png" width="80px">
						</a>
					</th>
					<th class="align-middle"><a href="<%=application.getContextPath()%>/product/product_view">${cart.pname}</a></th>
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
	
	<table class="table" style="margin-top: 50px;">
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
