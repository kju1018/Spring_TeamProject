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
				<p>Q&A입니다.</p>
			</div>
			</div>
		</div>

			<div class="container-fluid">
				<div class="row justify-content-center">
	<div style="width:70%;">
		<table class="pv_table" style="width:100%;">
		<tr>
			<th class="pv_table" style="width:20%">PRODUCT</th>
			<th class="pv_table" style="text-align: left; width:100%">&nbsp;북유럽식 식탁조명</th>
			<tr>
				<td class="pv_table">SUBJECT</td>
				<td class="pv_table" style="text-align: left">&nbsp;제품 크기</td>				
			</tr>
		<tr>
				<td class="pv_table">WRITER</td>
				<td class="pv_table" style="text-align: left">&nbsp;ㅎㅎ</td>				
			</tr>
			<tr>
				<td class="pv_table">DATE</td>
				<td class="pv_table" style="text-align: left">&nbsp;2021-03-10</td>				
			</tr>	
			<tr>
				<td class="pv_table" colspan="2" height="150" style="text-align:left">&nbsp;홈페이지 회원가입 후 등업신청 하시면 동영샹 메뉴얼을 보실 수 있습니다.</td>
								
			</tr>	
		
		</table>
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