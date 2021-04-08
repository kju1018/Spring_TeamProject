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
				<form action="pupdateqna" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="hidden" name="productno" value="${productqna.productno}">
    <table class="table">
        <tr>
            <th style="width:15%">글번호</th>
            <td><input type="text" class="form-control" name="boardno" value="${productqna.boardno}" readonly></td>
            <th style="width:15%">조회수</th>
            <td><input type="text" class="form-control" value="${productqna.bcount}" readonly></td>
        </tr>
        
        
        <tr>
            <th style="width:15%">작성자</th>
            <td><input type="text" class="form-control" value="${productqna.userid}" readonly></td>
            <th style="width:15%">작성일</th>
            <td><fmt:formatDate value="${productqna.bdate}" pattern="yyyy-MM-dd"/></td>
        </tr>
        
        <tr>
            <th style="width:15%">제목</th>
            <td colspan="3"><input type="text" class="form-control" name="btitle" id="btitle" value="${productqna.btitle}"></td>
        </tr>
        
        <tr>
            <th style="width:15%">글내용</th>
            <td colspan="3"><input type="text" class="form-control" name="bcontent" id="bcontent" value="${productqna.bcontent}"></td>
        </tr>
    </table>
	
            
	    <div class="q_v_bottom">
	        <hr/>
	        <input type="button" class="btn btn-dark btn-sm" value="취소" onclick="location.href ='<%=application.getContextPath()%>/product/p_qna_view?boardno=${productqna.boardno}'">
	        <button type="submit" class="btn btn-dark btn-sm">수정완료</button>         

	    </div>
	</form>
	
	<br>

	</div>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>