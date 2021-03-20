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
		
			<div class="container-fluid">
				<div class="row justify-content-center">
					<table class="pw_table" style="width:70%;">		
					<tr style="margin-letf:15%;">
			<td class="pw_table">PRODUCT</td>
			<td class="pw_table" style="text-align: left;">&nbsp;북유럽식 식탁조명</td>
			<tr>
				<td class="pw_table">SUBJECT</td>
				<td class="pw_table pw_input1"><input style="width:100%" type="text"></td>				
			</tr>
		<tr>
				<td class="pw_table">WRITER</td>
				<td class="pw_table" style="text-align: left">&nbsp;ㅎㅎ</td>				
			</tr>
			<tr>
				<td class="pw_table">DATE</td>
				<td class="pw_table" style="text-align: left">&nbsp;2021-03-10</td>				
			</tr>	
			<tr>
				<td class="pw_table" colspan="2" height="150"><input type="text"
					style="width:100%; height: 150px"></td>				
			</tr>	
		
		</table>
	</div>
	<br>
    <div>
        <a class="btn btn-light btn-outline-secondary" style="width:8%; margin-left:69.4%;" href="product_view" role="button"> 취소 </a>
        <a class="btn btn-light btn-outline-secondary" style="width:8%" href="product_view" role="button"> 완료 </a>
        
        </div>
	<br><br>	
	</div>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>