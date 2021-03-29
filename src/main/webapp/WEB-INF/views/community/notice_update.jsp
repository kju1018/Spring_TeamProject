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
    <img src="<%=application.getContextPath()%>/resources/image/slide8.png" class="container">
    <p class="titleyj">공지사항 상세</p>
    
    <!--게시판-->
	<form onsubmit="update(${notice.boardno})">
    <table class="table">
    <tr>
        <th style="width:15%">글번호</th>
        <td><input type="text" class="form-control" id="btitle" name="boardno"></td>
        <th style="width:15%">조회수</th>
        <td><input type="text" class="form-control" id="bcount" name="bcount"></td>
    </tr> 
    <tr>
        <th style="width:15%">작성자</th>
        <td><input type="text" class="form-control" id="userid" name="userid"></td>
        <th style="width:15%">작성일</th>
        <td><input type="text" class="form-control" id="bdate" name="bdate"></td>
    </tr>
    <tr>
        <th style="width:15%">제목</th>
        <td colspan="3"><input type="text" class="form-control" id="btitle" name="btitle"></td>
    </tr>
    <tr>
        <th style="width:15%">글 내용</th>
        <td colspan="3"><input type="text" class="form-control" id="bcontent" name="bcontent"></td>
    </tr>
    </table>
  	</form>
  	
  	
    <div class="n_v_bottom">
        <hr/>  
        <input type="button" class="btn btn-dark btn-sm"  value="목록보기" onclick="location.href ='<%=application.getContextPath()%>/community/notice_list'">
    </div>

       
     
   
</div>
<!-- 전체 컨텐츠 영역 -->


<%@ include file="/WEB-INF/views/common/footer.jsp" %>