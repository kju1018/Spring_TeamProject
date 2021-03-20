<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %>


<!-- 전체 컨텐츠 영역 -->
<div class="container" style="margin-top: 12em;">
	<!-- 오른쪽 상단 계단 메뉴-->
    <ol class="sm_navi">
        <li class="sm_nav">홈 > </li>
        <li class="sm_nav">커뮤니티 > </li>
        <li class="sm_nav">공지사항</li>
    </ol>
    <br/>

    <!--제목-->
    <img src="<%=application.getContextPath()%>/resources/image/slide7.jpg" class="container">
	<p class=titleyj>NOTICE</p>
	<p class=sub_title>공지사항입니다.</p>
	
	<div class="select_nav">
		<input type="button" class="btn btn-outline-dark" value="공지사항" onclick="location.href='notice_list'">
		<input type="button"  class="btn btn-outline-dark" value="QnA" onclick="location.href='qna_list'">          
	</div>            

 	<!--게시판-->
	<table class="table">
		<thead>
	    <tr>
            <th width="10%">NO</th>
            <th width="50%">SUBJECT</th>
            <th width="15%">WRITER</th>
            <th width="15%">DATE</th>
            <th width="10%">READ</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr class="notice_list" onclick="location.href='notice_view'">
	      <th scope="row">1</th>
	      <td>언제나 노력하고 고민하는 더파이브 되겠습니다. 감사합니다.</td>
	      <td>관리자</td>
	      <td>2021-03-27</td>
	      <td>43</td>
	    </tr>
	    <tr class="notice_list" onclick="location.href='notice_view'">
	      <th scope="row">2</th>
	      <td>시스템 점검 관련 공지</td>
	      <td>관리자</td>
	      <td>2021-02-12</td>
	      <td>63</td>
	    </tr>
	    <tr class="notice_list" onclick="location.href='notice_view'">
	      <th scope="row">3</th>
	      <td>배송 지연에 관한 사과의 말씀 드립니다.</td>
	      <td>관리자</td>
	      <td>2021-01-02</td>
	      <td>1203</td>
	    </tr>
	  </tbody>
	</table>
	<!--게시판-->
	
	<!-- 페이지 -->
    <ul class="pagenav">
        <li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_first.gif"></li>
        <li class="page-item">PREV</a></li>
        <li class="page-item">1</a></li>
        <li class="page-item">NEXT</a></li>
        <li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_last.gif"></li>
    </ul>

</div>
<!--전체 컨텐츠 영역--> 


<%@ include file="/WEB-INF/views/common/footer.jsp" %>