<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<script type="text/javascript">

	$(function(){
		getMyQnA(1);
	 });
	
	const test = (str) => {
		if(str==1){
			getMyQnA(1);
		} else if(str==2){
			qnaList(1);
		} else if(str==3){
			getProductReview();
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
	 		url:"<%=application.getContextPath()%>/product/myqna_list",
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
		<input type='button' value="주문내역" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/ordered_list'">
		<input type='button' value="회원정보" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/mypage_update'">
		<input type='button' value="좋아요" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/like_list'">
		<input type='button' value="게시물관리" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/post_list'">
		<input type='button' value="장바구니" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/cart/cart'">
	</div>
	
	  <select name="select_post" id="select_post" onchange="test(this.value)">
          <option value="1" >내가 쓴 QnA</option>
          <option value="2" >내가 쓴 제품 QnA</option>
          <option value="3" >내가 쓴 제품 QnA</option>
      </select>              
	<!-- 게시물 종류 선택 -->
	<div id="mypost_div">
	</div>

	<hr/>
	<!--게시판-->
	
	<!--게시판-->
	<div class="sel_nav">
		<label>[내가 쓴 제품 QnA]</label>
	</div>
	
	<table class="table mb-7">
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th width="25%">사진</th>
				<th  width="25%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
		</thead>
		<tbody>
		<tr>
			 	<td>1</td>
			 	<td><img src="<%=application.getContextPath()%>/resources/image/light4_sora.png"></td>
		         <td>배송관련 문의</td>
		         <td>user2</td>
		         <td>2021-03-31</td>
		         <td>5</td>
		</tr>   
		   <tr>
		   	<td colspan="6" class="text-center">
		   		<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
		   		<a class="btn btn-dark btn-sm"
		   		   href="post_list?pageNo=1">처음</a>
		   		
		   		<c:if test="${pager.groupNo>1}">
			   		<a class="btn btn-light btn-sm"
			   		   href="post_list?pageNo=${pager.startPageNo-1}">이전</a>
			   	</c:if>
		   		
		   		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		   			<c:if test="${pager.pageNo!=i}">
		   				<a class="btn btn-outline-secondary btn-sm" href="post_list?pageNo=${i}">${i}</a>
		   			</c:if>
		   			<c:if test="${pager.pageNo==i}">
		   				<a class="btn btn-outline-secondary btn-sm" href="post_list?pageNo=${i}">${i}</a>
		   			</c:if>
		   		</c:forEach>
		   		
		   		<c:if test="${pager.groupNo<pager.totalGroupNo}">
			   		<a class="btn btn-light btn-sm"
			   		   href="post_list?pageNo=${pager.endPageNo+1}">다음</a>
			   	</c:if>
			   	
		   		<a class="btn btn-dark btn-sm"
		   		   href="post_list?pageNo=${pager.totalPageNo}">맨끝</a>
		   	</td>
		   </tr>
		</tbody>
	
	</table>
	<hr/>
	<!--게시판-->

</div>
	<div class="c_bottom">
		<input type="button" class="btn btn-dark" value="메인화면으로" onclick="location.href ='<%=application.getContextPath()%>'">
	</div>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>