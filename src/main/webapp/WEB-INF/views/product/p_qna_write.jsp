<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container-fluid" style="margin-top:15%">
		<div class="row" >
				<div class="col-5 text-center">
			<div class="title">
				<h2>
			<font color="33333">Q&A</font>
		</h2>
		<p>Q&A 쓰기입니다.</p>
			</div>
			</div>
		</div>
		
			<div class="container">
				
				<form action="createqna" method="post">
    				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="productno" value="${productno}"/>
			        <table class="table">
			        	<tr>
			                <th>작성자</th>
			                <td colspan="3"><input type="text" id="userid" name="userid" value="${userid}" style="width: 100%;" readonly></td>
			            </tr>
			            
			            <tr>
			                <th>제목</th>
			                <td colspan="3"><input type="text" id="btitle" name="btitle" style="width: 100%;"></td>
			            </tr>
			            
			            <tr>
			                <th>글내용</th>
			                <td colspan="3"><textarea style="width: 100%;" id="bcontent" name="bcontent"></textarea></td>
			            </tr>
			        </table>
			
			            <div class="q_w_bottom">
			                <hr/>         
			                <button type="submit" class="btn btn-dark btn-sm">등록</button>
			                <input type="button" class="btn btn-dark btn-sm" value="목록보기" onclick="location.href ='<%=application.getContextPath()%>/product/product_view_user?productno=${productno}'">
			            </div>
			    </form>
	</div>
	</div>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>