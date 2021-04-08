<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<script type="text/javascript">

	$(function(){
		var selected = $("#select_post").val();
		if(selected==1){
			getMyQnA(1);
		}else if(selected==2){
			qnaList(1);
		}else if(selected==3){
			getProductReview(1);
		}  
	 });
	
	const test = (str) => {
		if(str==1){
			getMyQnA(1);
		} else if(str==2){
			qnaList(1);
		} else if(str==3){
			getProductReview(1);
		}
	};
	
	const getMyQnA = (pageNo) => {
	 	$.ajax({
	 		url:"<%=application.getContextPath()%>/community/myqna_list",
		    method: "get",
		    data: {pageNo}
	 	}).then(data => {
	 	  	$("#mypost_div").html(data);
		});
	};
	
	const qnaList = (pageNo) => {
	 	$.ajax({
	 		url:"<%=application.getContextPath()%>/product/product_myqna_list",
		    method: "get",
		    data: {pageNo}
	 	}).then(data => {
	 	  	$("#mypost_div").html(data);

		});
	};
	
	const getProductReview = (pageNo) => {
	 	$.ajax({
	 		url:"<%=application.getContextPath()%>/product/product_myreview_list",
		    method: "get",
		    data: {pageNo}
	 	}).then(data => {
	 	  	$("#mypost_div").html(data);
		});
	};
</script>

<!-- 전체 컨텐츠 영역 -->	
<div class="container" style="margin-top: 12em;">
	<!-- 오른쪽 상단 계단 메뉴-->
    <ol class="sm_navi">
        <li class="sm_nav">홈 > </li>
        <li class="sm_nav">마이페이지 > </li>
        <li class="sm_nav">게시물관리</li>
    </ol>
    <br/>
	<img src="<%=application.getContextPath()%>/resources/image/slide/slide10.PNG" class="container">
    <!--제목-->
	<div class="titleyj">
		<p>게시물 관리</p>
	</div>
	<div class="my_button">
		<input type='button' value="주문내역" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/ordered_list?pageNo=1'">
		<input type='button' value="회원정보" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/mypageupdate'">

		<input type='button' value="좋아요" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/likes/likelist?pageNo=1'">

		<input type='button' value="게시물관리" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/post_list'">
		<input type='button' value="장바구니" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/cart/cart'">
	</div>
	
	  <select name="select_post" id="select_post" onchange="test(this.value)">
          <option value="1" >내가 쓴 QnA</option>
          <option value="2" >내가 쓴 제품 QnA</option>
          <option value="3" >내가 쓴 제품 리뷰</option>
      </select>              
	<!-- 게시물 종류 선택 -->
	<div id="mypost_div" class="container-fluid">
	
	</div>


</div>
	<div class="c_bottom">
		<input type="button" class="btn btn-dark" value="메인화면으로" onclick="location.href ='<%=application.getContextPath()%>'">
	</div>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>