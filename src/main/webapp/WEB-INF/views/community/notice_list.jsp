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
		<input type="button" class="btn btn-outline-dark" value="공지사항" onclick="location.href ='<%=application.getContextPath()%>/community/notice_list?pageNo=1'">
		<input type="button"  class="btn btn-outline-dark" value="QnA" onclick="location.href ='<%=application.getContextPath()%>/community/qna_list?pageNo=1'">          
	</div>            

	<div style="text-align: right; margin-bottom: 4px;">
        <!-- <input type="button" class="btn btn-dark btn-sm" value="글쓰기" onclick="location.href ='<%=application.getContextPath()%>/community/notice_write'">  -->
    </div>
    
 	<!--게시판-->
	<table class="table">
		<thead>
	    <tr>
            <th style="width:10%">NO</th>
            <th style="width:50%">SUBJECT</th>
            <th style="width:15%">WRITER</th>
            <th style="width:15%">DATE</th>
            <th style="width:10%">READ</th>
	    </tr>
	  </thead>
	  <tbody>
	     <c:forEach var="notice" items="${list}">
		      <tr>
		         <td>${notice.boardno}</td>
		         <td><a href="notice_view?boardno=${notice.boardno}">${notice.btitle}</a></td>
		         <td>${notice.userid}</td>
		         <td><fmt:formatDate value="${notice.bdate}" pattern="yyyy-MM-dd"/></td>
		         <td>${notice.bcount}</td>
		      </tr>
		   </c:forEach>
		   
		   <tr>
		   	<td colspan="5" class="text-center">
		   		<!-- [처음][이전] 1 2 3 4 5 [다음][맨끝] -->
		   		<a class="btn btn-dark btn-sm"
		   		   href="notice_list?pageNo=1">처음</a>
		   		
		   		<c:if test="${pager.groupNo>1}">
			   		<a class="btn btn-light btn-sm"
			   		   href="notice_list?pageNo=${pager.startPageNo-1}">이전</a>
			   	</c:if>
		   		
		   		<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		   			<c:if test="${pager.pageNo!=i}">
		   				<a class="btn btn-outline-secondary btn-sm" href="notice_list?pageNo=${i}">${i}</a>
		   			</c:if>
		   			<c:if test="${pager.pageNo==i}">
		   				<a class="btn btn-outline-secondary btn-sm" href="notice_list?pageNo=${i}">${i}</a>
		   			</c:if>
		   		</c:forEach>
		   		
		   		<c:if test="${pager.groupNo<pager.totalGroupNo}">
			   		<a class="btn btn-light btn-sm"
			   		   href="notice_list?pageNo=${pager.endPageNo+1}">다음</a>
			   	</c:if>
			   	
		   		<a class="btn btn-dark btn-sm"
		   		   href="notice_list?pageNo=${pager.totalPageNo}">맨끝</a>
		   	</td>
		   </tr>
	  </tbody>
	</table>
	<!--게시판-->
	

</div>
<!--전체 컨텐츠 영역--> 


<%@ include file="/WEB-INF/views/common/footer.jsp" %>