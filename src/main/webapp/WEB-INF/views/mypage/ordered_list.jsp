<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script type="text/javascript">
	const cancelorder = (orderno) => {
		if(confirm("주문을 취소 하시겠습니까?") == true){
			location.href ="<%=application.getContextPath()%>/mypage/order_cancel?orderno="+orderno;
		} else{
			return ;
		}	
	}
</script>

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
		<input type='button' value="회원정보" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/mypageupdate'">

		<input type='button' value="좋아요" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/likes/likelist?pageNo=1'">

		<input type='button' value="게시물관리" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/post_list'">
		<input type='button' value="장바구니" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/cart/cart'">
	</div>
	
	<c:if test="${empty orderList}">
			<div class="text-center border p-5">
				주문내역이 없습니다.
			</div>
	</c:if>
	
	<c:if test="${not empty orderList}">
		<!--게시판-->
		<c:forEach items="${orderList}" var="order">
	<!-- 		<div class="tempdd"> -->
				<table class="orderedtable table mt-5 border">
					 <thead>
						<tr>
							<th width="20%"><span >주문 일자: <fmt:formatDate value="${order.odate}" pattern="yyyy-MM-dd"/></span></th>
							<th width="20%"></th>
							<th width="10%"></th>
							<th width="10%"></th>
							<th width="15%"></th>
							<th width="25%"><a href="<%=application.getContextPath()%>/mypage/order_view?orderno=${order.orderno}" style="color:gray;">주문내역 상세보기</a></th>
						</tr>
					</thead>
					
					<c:forEach items="${order.orderproductlist}" var="orderproduct">
						<tr class="ordered_list">
							<th>
								<a href="<%=application.getContextPath()%>/product/product_view_user?productno=${orderproduct.productno}">
									<img class="rounded" src="<%=application.getContextPath()%>/resources/image/lamp1.png" width="80px" >
								</a>	
							</th>
							<th>
								<a href="<%=application.getContextPath()%>/product/product_view_user?productno=${orderproduct.productno}">
									${orderproduct.pname}
								</a>
							</th>
							<th></th>
							<th>${orderproduct.pprice} 원</th>
							<th>수량: ${orderproduct.oquantity}개</th>
							<th>${order.ostatus}</th>
						</tr>
						<c:set var="total" value="${total+orderproduct.oquantity*orderproduct.pprice}"/>
					</c:forEach>
					
					<tr class="ordered_list">
						<th>총 금액: </th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th><c:out value="${total}"/>원</th>
					</tr>
				</table>
				<c:if test="${order.ostatus eq '배송중'}">
					<div class="text-right">
						<a class="btn btn-outline-dark btn-sm" onclick="cancelorder(${order.orderno})">배송취소</a>
					</div>
				</c:if>
				
	<!-- 		</div> -->
		<!--게시판-->
		</c:forEach>
		<div class="d-flex">
			<div class="flex-grow-1 text-center">
			<!--[처음][이전] 1 2 3 4 5 [다음][맨끝] -->
				<a class="btn btn-outline-dark btn-sm"
				href="ordered_list?pageNo=1">처음</a>
				
				<c:if test="${pager.groupNo>1}">
					<a class="btn btn-outline-secondary btn-sm"
						href="ordered_list?pageNo=${pager.startPageNo-1}">이전</a>
				</c:if>
			
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo!=i}">
						<a class="btn btn-outline-success btn-sm" href="ordered_list?pageNo=${i}">${i}</a>
					</c:if>
					
					<c:if test="${pager.pageNo==i}">
						<a class="btn btn-danger btn-sm" href="ordered_list?pageNo=${i}">${i}</a>
					</c:if>
				</c:forEach>
			
				<c:if test="${pager.groupNo<pager.totalGroupNo}">
					<a class="btn btn-outline-secondary btn-sm"
						href="ordered_list?pageNo=${pager.endPageNo+1}">다음</a>
				</c:if>
			
				<a class="btn btn-outline-dark btn-sm"
				href="ordered_list?pageNo=${pager.totalPageNo}">맨끝</a>
			</div>					
		</div>		
    </c:if>
    <br/>
    <br/>

    <!-- 페이지 -->

	<div class="text-center">
		<input type="button" class="btn btn-dark" value="메인화면으로" onclick="location.href ='<%=application.getContextPath()%>'">
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>