<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>



<!-- 전체 컨텐츠 영역 -->
<div class='container' style="margin-top: 12em;">
	<!-- 오른쪽 상단 계단 메뉴-->
    <ol class="sm_navi">
        <li class="sm_nav">홈 > </li>
        <li class="sm_nav">마이페이지 > </li>
        <li class="sm_nav">좋아요</li>
    </ol>
    <br/>

    <!--제목-->
	<p class='title'>좋아요</p>

	<!--검색창-->
	<div class='find_zone'>
	<input type='text' name='findStr' />
	<input type='button' class="btn btn-dark btn-sm" value='검색' id='btnFind' name='select' />
	</div>
	
	<!--게시판-->
	<table class="table">
		<tr>
            <th><input type="checkbox" name="" id="checkAll" onclick="selectAll(this)"/></th>
			<th width="30%">제품사진</th>
			<th width="55%">상품명</th>
			<th width="15%">삭제</th>
		</tr>
		<tr onclick="location.href='product_view'">
            <th><input type="checkbox" name="chk_box" class="checkSelect"/></th>
			<th><img src = "<%=application.getContextPath()%>/resources/image/lamp1.png" width="50"></th>
			<th>북유럽풍 조명 장식</th>
			<th><input type="button" class="btn btn-outline-dark btn-sm" value="삭제"></th>
		</tr>
		
		<tr onclick="location.href='product_view'">
            <th><input type="checkbox" name="chk_box" class="checkSelect"/></th>
			<th><img src = "<%=application.getContextPath()%>/resources/image/lamp2.png" width="50"></th>
			<th>스칸디나비아 주방 식탁</th>
			<th><input type="button" class="btn btn-outline-dark btn-sm" value="삭제"></th>
		</tr>
	</table>
	<!--게시판-->

    <div class="l_l_bottom">
        <input type="button" class="btn btn-dark" value="마이페이지로" onclick="location.href ='mypage'">
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


</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>