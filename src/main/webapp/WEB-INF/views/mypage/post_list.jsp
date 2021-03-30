<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>


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
		<input type='button' value="장바구니" class="btn btn-outline-dark" onclick="location.href ='<%=application.getContextPath()%>/mypage/cart'">
	</div>
	
	<!-- 게시물 종류 선택 -->
	<div class="sel_nav">
		<label>분류선택</label>
		<select>
			<option>제품리뷰</option>
			<option>제품QnA</option>
			<option>QnA</option>
		</select>
	</div>

	<!--게시판-->
	<table class="table">
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th  width="60%">제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${list}">
		      <tr>
		         <td>${notice.boardno}</td>
		         <td><a href="notice?boardno=${notice.boardno}">${notice.btitle}</a></td>
		         <td>${notice.bcontent}</td>
		         <td>${notice.userid}</td>
		         <td><fmt:formatDate value="${notice.bdate}" pattern="yyyy-MM-dd"/></td>
		         <td>${notice.bcount}</td>
		      </tr>
		   </c:forEach>
		</tbody>
	</table>
	<!--게시판-->

    
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