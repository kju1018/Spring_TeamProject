<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<div class="container" style="margin-top:15%">
		<div class="row" >
				<div class="col-5 text-center">
			<div class="title">
				<h2>
					<font color="33333">Q&A</font>
				</h2>
				<p>Q&A입니다.</p>
			</div>
			</div>
		</div>

			<div class="container">
				<div class="row justify-content-center">
	<div style="width:70%;">
	<input type="hidden" name="productno" value="${productqna.productno}">
		<table class="table">
		
    <tr>
        <th style="width:15%">글번호</th>
        <td><input type="text" class="form-control" value="${productqna.boardno}" readonly></td>
        <th style="width:15%">조회수</th>
        <td><input type="text" class="form-control" value="${productqna.bcount}" readonly></td>
    </tr> 
    <tr>
        <th style="width:15%">작성자</th>
        <td><input type="text" class="form-control" value="${productqna.userid}" readonly></td>
        <th style="width:15%">작성일</th>
        <td><fmt:formatDate value="${notice.bdate}" pattern="yyyy-MM-dd" /></td>
    </tr>
    <tr>
        <th style="width:15%">제목</th>
        <td colspan="3"><input type="text" class="form-control" value="${productqna.btitle}" readonly></td>
    </tr>
    <tr>
        <th style="width:15%">글 내용</th>
        <td colspan="3"><input type="text" class="form-control" value="${productqna.bcontent}" readonly></td>
    </tr>
    </table>
  
    <div class="n_v_bottom">
        <hr/>  
        <input type="button" class="btn btn-dark btn-sm"  value="목록보기" onclick="location.href ='<%=application.getContextPath()%>/product/product_view_user?productno=${productqna.productno}'">
        <c:if test="${loginUid == notice.userid}">
	        <input type="button" class="btn btn-dark btn-sm" value="수정하기" onclick="location.href ='<%=application.getContextPath()%>/product/qna_update?boardno=${productqna.boardno}'">          
	        <input type="button" class="btn btn-dark btn-sm" value="삭제하기" onclick="location.href ='<%=application.getContextPath()%>/product/pdeleteqna?boardno=${productqna.boardno}&productno=${productqna.productno}'">
		</c:if>   
    </div>
		
	
	</div>
	</div>
	
	<br>
	<div>
        <a class="btn btn-light btn-outline-secondary" style="width:8%; margin-left:77.7%;" href="<%=application.getContextPath()%>/product/product_view" role="button"> 목록 </a>
   </div>
	<br><br>
	</div>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>