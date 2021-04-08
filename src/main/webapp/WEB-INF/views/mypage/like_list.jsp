<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<script>
const individualDelete = (pageNo) => {
	const productno = pageNo;
	var urlresult ="";
	if(productno != ""){
		$.ajax({
			url:"likedelete",
			data: {productno},
			method : "get"
		}).then(data => {
			console.log(data);
			if(data.result != "null"){
				const url = "<%=application.getContextPath()%>/likes/likelist?pageNo=";
				const page = data.page;
				urlresult = url+""+page;
				console.log(urlresult);
				
				alert("삭제되었습니다.");
				window.location.href=urlresult;
			}
		})
	}
}

const allDelete = () => {
	console.log("실행");
	$.ajax({
		url:"alldelete",
		method: "get"
	}).then(data => {
		console.log(data.result);
		if(data.result == "success"){
			alert("삭제되었습니다.");
			window.location.href="<%=application.getContextPath()%>/likes/likelist";
		}
	})
}
</script>

<!-- 전체 컨텐츠 영역 -->
<div class='container' style="margin-top: 12em;">
	<!-- 오른쪽 상단 계단 메뉴-->
    <ol class="sm_navi">
        <li class="sm_nav">홈 > </li>
        <li class="sm_nav">마이페이지 > </li>
        <li class="sm_nav">좋아요</li>
    </ol>
    <br/>
	<img src="<%=application.getContextPath()%>/resources/image/slide/slide10.PNG" class="container">
    <!--제목-->
	<p class='titleyj'>좋아요</p>
	<div class="my_button item_mb-3">
	<input type='button' value="주문내역" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/ordered_list?pageNo=1'">
		<input type='button' value="회원정보" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/mypageupdate'">

		<input type='button' value="좋아요" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/likes/likelist?pageNo=1'">

		<input type='button' value="게시물관리" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/post_list'">
		<input type='button' value="장바구니" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/cart/cart'">
	</div>
	
	<!--검색창-->
	
	
	<!--게시판-->
	<table class="table">
		<tr>
            <th><input type="checkbox" name="" id="checkAll" onclick="selectAll(this)"/></th>
			<th width="30%">제품사진</th>
			<th width="55%">상품명</th>
			<th width="15%">삭제</th>
		</tr>
		<c:forEach var="product" items="${likeList}">
			<tr>
	            <th><input type="checkbox"  name="chk_box" class="checkSelect"/></th>
				<th><img src = "<%=application.getContextPath()%>/product/downloadImags_detail?savename=${product.isavename}" width="50"></th>
				<th onclick="location.href ='<%=application.getContextPath()%>/product/product_view_user?productno=${product.productno}'">${product.pname} </th>
				<th><input onclick="individualDelete(${product.productno})" type="button" class="btn btn-outline-dark btn-sm" value="삭제"></th>
			</tr>
		</c:forEach>
		<c:if test = "${number == 0}">
			<tr>
				<th class="text_center_sort" colspan="4"><p class=" item_mt-2">주문내역이 없습니다.</p></th>
			</tr>
		</c:if>
	</table>
	<!--게시판-->

    <br/>
	<div>
	<c:if test = "${number > 0}">
    	<button onclick="allDelete()" class="btn btn-outline-danger float-right">전체삭제</button>
    </c:if>	
    </div>
	<!-- 페이지 -->
	<c:if test = "${number > 0}">
     	<ul class="pagenav">
	   	    <li class="page-item"><a href="<%=application.getContextPath()%>/likes/likelist?pageNo=1"><img src="<%=application.getContextPath()%>/resources/image/btn_page_first.gif"></a></li>
	    	<c:if test="${likelistpager.groupNo>1}">
	    		<li class="page-item"><a href="<%=application.getContextPath()%>/likes/likelist?pageNo=${likelistpager.startPageNo-1}">PREV</a></li>
	    	</c:if>
	        <c:forEach var="i" begin="${likelistpager.startPageNo}" end="${likelistpager.endPageNo}">
	        	<c:if test="${likelistpager.pageNo != i}">
	        		<li class="page-item"><a href="<%=application.getContextPath()%>/likes/likelist?pageNo=${i}">${i}</a></li>
	        	</c:if>
	        	<c:if test="${likelistpager.pageNo == i}">
	        		<li class="page-item font-weight-bold"><a href="<%=application.getContextPath()%>/likes/likelist?pageNo=${i}">${i}</a></li>
	        	</c:if>
	        </c:forEach>
	        <c:if test="${likelistpager.groupNo<likelistpager.totalGroupNo}">
	    		<li class="page-item"><a href="<%=application.getContextPath()%>/likes/likelist?pageNo=${likelistpager.endPageNo+1}">NEXT</a></li>
	    	</c:if>
	    	<li class="page-item"><a href="<%=application.getContextPath()%>/likes/likelist?pageNo=${likelistpager.totalPageNo}"><img src="<%=application.getContextPath()%>/resources/image/btn_page_last.gif"></a></li>
	    </ul>
     </c:if>	

	<div class="c_bottom">
		<input type="button" class="btn btn-dark" value="메인화면으로" onclick="location.href ='<%=application.getContextPath()%>'">
	</div>
	
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>