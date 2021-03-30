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
        <li class="sm_nav">QnA</li>
    </ol>
    <br/>

    <!--제목-->
    <img src="<%=application.getContextPath()%>/resources/image/slide7.jpg" class="container">
	<p class="titleyj">QnA</p>
	<p class="sub_title">QnA입니다.</p>
	
	<!-- 공지사항 QnA 선택 버튼 -->
	<div class="select_nav">
		<input type="button" class="btn btn-outline-dark" value="공지사항" onclick="location.href ='<%=application.getContextPath()%>/community/notice_list'">
		<input type="button" class="btn btn-outline-dark" value="QnA" onclick="location.href ='<%=application.getContextPath()%>/community/qna_list'">          
	</div>            

    <div style="text-align: right; margin-bottom: 4px;">
        <input type="button" class="btn btn-dark btn-sm" value="글쓰기" onclick="location.href ='<%=application.getContextPath()%>/community/qna_write'"> 
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
               <c:forEach var="communityqna" items="${list}">
		      <tr>
		         <td>${communityqna.boardno}</td>
		         <td><a href="qna_view?boardno=${communityqna.boardno}">${communityqna.btitle}</a></td>
		         <td>${communityqna.userid}</td>
		         <td><fmt:formatDate value="${communityqna.bdate}" pattern="yyyy-MM-dd"/></td>
		         <td>${communityqna.bcount}</td>
		      </tr>
		   </c:forEach>
            </tbody>
    </table>
	<!--게시판-->

    <!-- 페이지 -->
    <ul class="pagenav">
        <li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_first.gif"></li>
        <li class="page-item"><a href="#">PREV</a></li>
        <li class="page-item"><a href="#">1</a></li>
        <li class="page-item"><a href="#">NEXT</a></li>
        <li class="page-item"><img src="<%=application.getContextPath()%>/resources/image/btn_page_last.gif"></li>
    </ul>
    

</div>
<!--전체 컨텐츠 영역--> 


<%@ include file="/WEB-INF/views/common/footer.jsp" %>