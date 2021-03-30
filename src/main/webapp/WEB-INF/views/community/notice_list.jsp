<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<input type="button" class="btn btn-outline-dark" value="공지사항" onclick="location.href ='<%=application.getContextPath()%>/community/notice_list'">
		<input type="button"  class="btn btn-outline-dark" value="QnA" onclick="location.href ='<%=application.getContextPath()%>/community/qna_list'">          
	</div>            

	<div style="text-align: right; margin-bottom: 4px;">
        <input type="button" class="btn btn-dark btn-sm" value="글쓰기" onclick="location.href ='<%=application.getContextPath()%>/community/notice_write'"> 
    </div>
    
 	<!--게시판-->
	<table class="table">
		<thead>
	    <tr>
            <th style="width:10%">NO</th>
            <th style="width:50%">SUBJECT</th>
            <th style="width:15%"></th>
            <th style="width:15%">DATE</th>
            <th style="width:10%">READ</th>
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
	
	<!-- 페이지 -->
    <ul class="pagenav">
        <li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_first.gif"></li>
        <li class="page-item">PREV</li>
        <li class="page-item">1</li>
        <li class="page-item">NEXT</li>
        <li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_last.gif"></li>
    </ul>

</div>
<!--전체 컨텐츠 영역--> 


<%@ include file="/WEB-INF/views/common/footer.jsp" %>