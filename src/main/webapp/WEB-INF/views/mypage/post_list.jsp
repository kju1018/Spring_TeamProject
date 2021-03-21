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
			<tr class="post_list" onclick="location.href ='<%=application.getContextPath()%>/community/qna_view'">
				<th scope="row">1</th>
				<td>배송 관련 문의</td>
				<td>이연정</td>
				<td>2021-03-12</td>
			</tr>
			<tr class="post_list" onclick="location.href ='<%=application.getContextPath()%>/community/qna_view'">
				<th scope="row">2</th>
				<td>환불했는데 돈 언제 들어오나요?</td>
				<td>이연정</td>
				<td>2021-01-18</td>
			</tr>
			<tr class="post_list" onclick="location.href ='<%=application.getContextPath()%>/community/qna_view'">
				<th scope="row">3</th>
				<td>상품 훼손되서 왔는데 교환 가능한가요?</td>
				<td>이연정</td>
				<td>2020-12-02</td>
			</tr>
		</tbody>
	</table>
	<!--게시판-->

    <!--하단 버튼-->
    <div class="p_l_bottom">
        <input type="button" class="btn btn-dark" value="마이페이지로" onclick="location.href ='<%=application.getContextPath()%>/mypage/mypage'">
    </div>
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

</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>