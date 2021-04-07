<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<div class="container-fluid" style="margin-top:5%">
		<div class="row" >
		<div class="col-5 text-center">
			<div class="title">
				<h2>
					<font color="33333">REVIEW</font>
				</h2>
				<p>상품 사용후기입니다.</p>
			</div>
			</div>
		</div>
			
			<div class="container-fluid">
			
				<div class="row justify-content-center">
				
					<table class="rv_table" style="width:70%;">		
					<tr>
					<th class="rv_table" colspan="2">
						<c:if test="${reviews.borgimg != null}">
						<div id="rv_div1" class="col-2 content-left">
						<img src="<%=application.getContextPath()%>/product/downloadImags_detail?savename=${reviews.bsaveimg}&type=${reviews.bimgtype}" style="margin: 10px; width:150px; height:100px;">
						</div>		
						</c:if>				
						<div id="rv_div2" class="col-9" >
							<hr style="color:lightgray"/>
              <button class="btn btn-dark"  onclick="reviewList(1)" role="button"> 상품상세보기 </button>
                       						
						</div>
					</th>
					</tr>	
						<tr>
								<td class="rv_table">SUBJECT</td>
								<td class="rv_table" style="text-align: left; width:70%;">&nbsp;${reviews.btitle}</td>
							</tr>
							<tr>
								<td class="rv_table">WRITER</td>
								<td class="rv_table" style="text-align: left">&nbsp;${reviews.userid}</td>
							</tr>
							<tr>
								<td class="rv_table">DATE</td>
								<td class="rv_table" style="text-align: left">&nbsp;<fmt:formatDate value="${reviews.bdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr>
								<td class="rv_table" colspan="2" height="150">${reviews.bcontent}</td>
							</tr>		
							
					</table>
					</div>
						<br>
               <div>
              		 <button class="btn btn-light btn-outline-secondary" style="width:8%; margin-left:61%;" onclick="reviewUpdateForm(${reviews.boardno})" > 수정 </button>                   
                   <button class="btn btn-light btn-outline-secondary" style="width:8%;" onclick="deleteReview(${reviews.boardno})" > 삭제 </button>
                   <button class="btn btn-light btn-outline-secondary" style="width:8%;" onclick="reviewList(1)" > 목록 </button>
              
              </div>
          
				<br><br>
</div>
</div>
