<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script>
$(function(){
	if(${result eq 'success'}){
		
	}else{
		alert("제품을 구매한 회원만 리뷰를 쓸 수 있습니다.");
		reviewList(1);
	}	
});
</script>

 <div class="container-fluid" style="margin-top:5%">
		<div class="row" >
				<div class="col-5 text-center">
			<div class="title">
				<h2>
			<font color="33333">REVIEW</font>
		</h2>
		<p>리뷰 쓰기입니다.</p>
			</div>
			</div>
		</div>
	
	
		
			<div class="container-fluid">
			<form onsubmit="reviewWrite()">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>						
				<input type="hidden" value="${productreviews.productno}" id="productno" name="productno">
				<div class="row justify-content-center">
					<table class="rw_table" style="width:70%;">		
							<tr>
							<th class="rw_table" colspan="2">
								<div id="rw_div2" class="col-9" >
									<hr style="color:lightgray"/>
									<input type="file" id="battach" name="battach">							
								</div>
							</th>
							</tr>
		
							<tr class="rw_table">
								<td class="rw_table">SUBJECT</td>
								<td class="rw_table input1"> <input type="text" style="width:100%" id="btitle" name="btitle"></td>
							</tr>
							<tr>
								<td class="rw_table" colspan="2" height="150">
								<textarea cols="50" rows="10" style="width: 100%; height: 150px" id="bcontent" name="bcontent"></textarea></td>
								
							</tr>
				
						</table>
				</div>
					<br>
								    		
		   			 <button type="button" class="btn btn-light btn-outline-secondary" style="width:8%;margin-left:69.4%;" onclick="reviewList(1)"> 취소 </button>
		   			  <button type="button" class="btn btn-light btn-outline-secondary" style="width:8%; " onclick="reviewWrite()"> 완료 </button>
		   		        
		    </form>
        <br><br>
	</div>
	</div>
