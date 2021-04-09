<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<form id="cart_form" onsubmit="checkCart()" action="<%=application.getContextPath()%>/order/order_form" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<table class="table" style="margin-top: 30px;">
			<tr>
				<th><input type="checkbox" name="checkbox_All" id="checkbox_All" onclick="checkAll()" checked/></th>
				<th width="20%" class="text-center">제품사진</th>
				<th width="20%" class="text-center">상품정보</th>
				<th width="13%" class="text-center">가격</th>
				<th width="10%" class="text-center">수량</th>
				<th width="7%"></th>
				<th width="20%" class="text-center">구매금액</th>
				<th width="10%" class="text-center">배송비</th>
			</tr>
			
			<c:if test="${empty cartList}">
				<tr class="cart_list" >
					<td colspan="8" class="text-center p-5">
						장바구니가 비어있습니다.
					</td>
				</tr>
				<c:set var="total" value="${0}"/>
			</c:if>
	
			<c:if test="${not empty cartList}">
					<input type="hidden" id="quantity" name="quantity" value=""/>
					<input type="hidden" name="isCart" value="1"/>
					<c:forEach var="cart" items="${cartList}">
						<tr class="cart_list" >
							<th class="align-middle text-center"><input type="checkbox" name="chk_productno" class="checkSelect" value="${cart.productno}" checked onclick="check(${cartList.size()})"/></th>
							<th class="align-middle text-center">
								<a href="<%=application.getContextPath()%>/product/product_view_user?productno=${cart.productno}">
									<img src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${cart.isavename}&type=${cart.imgtype}" width="80px">
								</a>
							</th>
							<th class="align-middle text-center"><a href="<%=application.getContextPath()%>/product/product_view_user?productno=${cart.productno}">${cart.pname}</a></th>
							<th class="align-middle text-center">${cart.pprice}원</th>
							<th class="align-middle text-center">
								<input type="number" min="1" id="cartquantity${cart.productno}" value="${cart.cartquantity}" style="width:50%"> 개
							</th>
							<th class="align-middle text-center">
								<a class="btn btn-outline-dark btn-sm" style="width:100%" onclick="updatecartquantity(${cart.productno})">변경</a>
							</th>
							<th class="align-middle text-center"><span id="productprice${cart.productno}">${cart.cartquantity*cart.pprice}</span>원</th>
							<th class="align-middle text-center">무료</th>
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
			<th><span id="totalprice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total}"/></span>원</th>
			<th>+<span id="fee">0</span> 원</th>
			<th>= <span id="totalprice2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${total}"/></span>원</th>
		</tr>
	</table>
	
	<div class="c_bottom">
		<button class="btn btn-dark">상품주문</button>
		<input  type="button" class="btn btn-dark" value="쇼핑계속하기" onclick="location.href ='<%=application.getContextPath()%>'">
	</div>
	
</form>