<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	<form action="create1" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	    <table class="table">
			<tr>
				<th>작성자</th>
				<td colspan="3"><input type="text" id="userid" name="userid" value="${userid}" style="width: 100%;" readonly></td>
			</tr>
	            
			<tr>
		        <th style="width:15%">제목</th>
		        <td colspan="3"><input type="text" id="btitle" name="btitle" style="width: 100%;"></td>
			</tr>
			<tr>
		        <th style="width:15%">글 내용</th>
		        <td colspan="3"><textarea style="width: 100%;" id="bcontent" name="bcontent"></textarea></td>
			</tr>
	
	    </table>
	  	
  	
  	
    <div class="n_v_bottom">
        <hr/>
        <button type="submit" class="btn btn-dark btn-sm">등록</button>  
        <input type="button" class="btn btn-dark btn-sm"  value="목록보기" onclick="location.href ='<%=application.getContextPath()%>/community/notice_list'">
    </div>
	</form>
       
     
   
</div>
<!-- 전체 컨텐츠 영역 -->


<%@ include file="/WEB-INF/views/common/footer.jsp" %>