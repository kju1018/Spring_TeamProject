<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container-fluid" style="margin-top:15%">
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
			
				<div class="row justify-content-center">
			<table class="rw_table" style="width:70%;">		
					<tr>
					<th class="rw_table" colspan="2">
						<%-- <div id="rw_div1" class="col-2 content-left">
						<img src="<%=application.getContextPath()%>/resources/image/light2_sora.png" width="80%" height="80%" style="margin: 10px">
						</div>	 --%>					
						<div id="rw_div2" class="col-9" >
							<!-- <b>북유럽식 식탁조명<br>50,000원</b> -->
							<hr style="color:lightgray"/>
							<input type="file" id="borgimg" name="borgimg">							
						</div>
					</th>
					</tr>

					<tr class="rw_table">
						<td class="rw_table">SUBJECT</td>
						<td class="rw_table input1"> <input type="text" style="width:100%" id="btitle" name="btitle"></td>
					</tr>
					<tr>
						<td class="rw_table" colspan="2" height="150">
						<input type="text" style="width: 100%; height: 150px" id="bcontent" name="bcontent"></td>
		
					</tr>
		
				</table>
			</div>
			<br>
    		<div>
        <button class="btn btn-light btn-outline-secondary" style="width:8%; margin-left:69.4%;" onclick="<%=application.getContextPath()%>/product/product_review_list"> 취소 </button>
        <button class="btn btn-light btn-outline-secondary" style="width:8%" type="submit"> 완료 </button>
        
        </div>
        </form>
			<br><br>
	</div>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>