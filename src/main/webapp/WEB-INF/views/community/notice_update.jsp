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
    <img src="<%=application.getContextPath()%>/resources/image/slide8.png" class="container">
    <p class="titleyj">공지사항 수정</p>
    
    <!--게시판-->
	<form action="updatenoti" method="post">
    <table class="table">
    <tr>
        <th style="width:15%">글번호</th>
        <td><input type="text" class="form-control" name="boardno" value="${notice.boardno}" readonly></td>
        <th style="width:15%">조회수</th>
        <td><input type="text" class="form-control" name="bcount" value="${notice.bcount}" readonly></td>
    </tr> 
    <tr>
        <th style="width:15%">작성자</th>
        <td><input type="text" class="form-control" name="userid" value="${notice.userid}" readonly></td>
        <th style="width:15%">작성일</th>
        <td><fmt:formatDate value="${notice.bdate}" pattern="yyyy-MM-dd"/></td>
    </tr>
    <tr>
        <th style="width:15%">제목</th>
        <td colspan="3"><input type="text" class="form-control" id="btitle" name="btitle" value="${notice.btitle}"></td>
    </tr>
    <tr>
        <th style="width:15%">글 내용</th>
        <td colspan="3"><input type="text" class="form-control" id="bcontent" name="bcontent" value="${notice.bcontent}"></td>
    </tr>
    </table>
  
  	
  	
    <div class="n_v_bottom">
        <hr/>  
        <input type="button" class="btn btn-dark btn-sm" value="취소" onclick="location.href ='notice_view?boardno=${notice.boardno}'">
	    <button type="submit" class="btn btn-dark btn-sm">수정완료</button>     
        <input type="button" class="btn btn-dark btn-sm"  value="목록보기" onclick="location.href ='<%=application.getContextPath()%>/community/notice_list'">
    </div>
	</form>
       
     
   
</div>
<!-- 전체 컨텐츠 영역 -->


<%@ include file="/WEB-INF/views/common/footer.jsp" %>